use std::collections::HashMap;
use std::collections::HashSet;
use std::fs;

// Words are in a csv format, in quotes and comma separated
fn get_the_words(word_string: String) -> Vec<String> {
    let mut res: Vec<String> = Vec::new();
    for s in word_string.split(",") {
        let mut char_vec: Vec<char> = s.chars().collect();
        char_vec.retain(|&c| c != '"');
        res.push(char_vec.into_iter().collect());
    }
    res
}

// to make the sets of anagrams, we go through all the words, using a map of sets as temp
// storage, keyed by a string made of the sorted chars of each word. We then return
// the values
fn make_anagram_sets(words: Vec<String>) -> HashSet<Vec<String>> {
    let mut map: HashMap<String, HashSet<String>> = HashMap::new();
    for word in words {
        let mut char_vec: Vec<char> = word.chars().collect();
        char_vec.sort();
        let key: String = char_vec.into_iter().collect();
        match map.get_mut(&key) {
            Some(v) => {
                v.insert(word);
            },
            None => {
                let mut vv = HashSet::<String>::new();
                vv.insert(word);
                map.insert(key, vv);
            }
        }
    }
    let mut res: HashSet<Vec<String>> = HashSet::new();
    for set in map.values() {
        let mut v: Vec<String> = set.iter().cloned().collect();
        if v.len() > 1 {
            v.sort();
            res.insert(v);
        }
    }
    res
}

// A cache of perfect squares, keyed by length. They're stored as char vecs for convenience later
fn get_squares() -> HashMap<i32, Vec<Vec<char>>> {
    let mut res: HashMap<i32, Vec<Vec<char>>> = HashMap::new();
    res.insert(1, Vec::<Vec<char>>::new());
    res.insert(2, Vec::<Vec<char>>::new());
    res.insert(3, Vec::<Vec<char>>::new());
    res.insert(4, Vec::<Vec<char>>::new());
    res.insert(5, Vec::<Vec<char>>::new());
    res.insert(6, Vec::<Vec<char>>::new());
    res.insert(7, Vec::<Vec<char>>::new());
    res.insert(8, Vec::<Vec<char>>::new());
    res.insert(9, Vec::<Vec<char>>::new());

    let lower = (10 as f32).sqrt() as i64;
    let upper = (1000000000 as f32).sqrt() as i64;

    for i in lower..upper {
        let sq = i*i;
        let key = (sq as f32).log10() as i32 + 1;
        res.get_mut(&key).unwrap().push(sq.to_string().chars().collect());
    }
    res
}

fn get_allowable_square(n: Vec<char>) -> Option<i64> {
    if '0' == n[0] {
        None
    } else {
        let n: String = n.iter().collect();
        let n: i64 =  n.parse::<i64>().unwrap();
        let root: i64 = (n as f64).sqrt() as i64;
        if root * root == n {
            Some(n)
        } else {
            None
        }
    }
}

fn get_valid_encoding(word: String, digits: Vec<char>) -> Option<HashMap<char,char>> {
    let mut encoding: HashMap<char, char> = HashMap::new();
    let mut rev_encoding: HashMap<char, char> = HashMap::new();

    let word: Vec<char> = word.chars().collect();
    for i in 0..word.len() {
        let key = digits[i];
        let val = word[i];
        match encoding.get(&key) {
            Some(existing_val) => {
                if val != *existing_val {
                    return None;
                }
            },
            None => {
                encoding.insert(key, val);
            }
        }
        match rev_encoding.get(&val) {
            Some(existing_key) => {
                if key != *existing_key {
                    return None;
                }
            },
            None => {
                rev_encoding.insert(val, key);
            }
        }
    }
    //println!("{:?} against {:?} is VALID", word, digits);
    //println!("{:?}", rev_encoding);
    Some(rev_encoding)
}

fn get_valid_encoded_square(word: String, encoding: HashMap<char, char>) -> Option<i64> {
    let word: Vec<char> = word.chars().collect();
    //println!("{:?}", word);
    let mut candidate_sq: Vec<char> = Vec::new();
    for c in word {
        candidate_sq.push(*encoding.get(&c).unwrap());
    }
    //println!("{:?}", candidate_sq);
    match get_allowable_square(candidate_sq) {
        Some(square) => {
            return Some(square);
        },
        None => {
            return None;
        }
    }

}

fn find_anagramic_squares(anagram_sets: HashSet<Vec<String>>, squares_map: HashMap<i32, Vec<Vec<char>>>) {
    for set in anagram_sets {
        println!("{:?}", set);
        for i in 0..set.len() - 1 {
            let word = &set[i];
            let l = word.len() as i32;
            for digits in squares_map.get(&l).unwrap() {
                match get_valid_encoding(word.to_string(), digits.to_vec()) {
                    Some(encoding) => {
                        match get_valid_encoded_square(set[i+1].to_string(), encoding) {
                            Some(square) => {
                                let ss: String = digits.iter().collect();
                                let ss: i64 = ss.parse().unwrap();
                                println!("{}, {}", square, ss);
                            },
                            None => {
                            }
                        }
                    },
                    None => {
                        continue;
                    }
                }
            }
        }
    }
}

fn main() {
    let mut word_string = fs::read_to_string("words.txt").expect("oops");
    // Rust includes an EOF char (or something?)
    word_string.truncate(word_string.len() - 1);

    let words = get_the_words(word_string.to_string());
    let anagram_sets = make_anagram_sets(words);
    println!("{:?}", anagram_sets);

    let squares_map = get_squares();

    find_anagramic_squares(anagram_sets, squares_map);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_get_the_words() {
        let input = "\"foo\",\"bar\"".to_string();
        let expect = vec!["foo", "bar"];
        assert_eq!(get_the_words(input), expect);
    }

    #[test]
    fn test_make_anagram_vecs() {
        let input = vec!["oof".to_string(), "bar".to_string(), "bra".to_string(), "race".to_string(), "care".to_string()];

        let mut expect: HashSet<Vec<String>> = HashSet::new();
        expect.insert(vec!["bar".to_string(), "bra".to_string()]);
        expect.insert(vec!["care".to_string(), "race".to_string()]);

        assert_eq!(make_anagram_sets(input), expect);
    }

    #[test]
    fn test_make_the_map_of_sets() {
        let input = vec!["oof".to_string(), "bar".to_string(), "bra".to_string()]; 
  
        let mut output: HashMap<String, HashSet<String>> = HashMap::new();
        output.insert("foo".to_string(), vec!["oof".to_string()].into_iter().collect());
        output.insert("abr".to_string(), vec!["bra".to_string(), "bar".to_string()].into_iter().collect());
        
        assert_eq!(_make_the_map_of_sets(input), output);
            
    }

    #[test]
    fn test_find_the_word_sets() {
        let mut input: HashMap<String, HashSet<String>> = HashMap::new();
        input.insert("foo".to_string(), vec!["oof".to_string()].into_iter().collect());
        input.insert("abr".to_string(), vec!["bra".to_string(), "bar".to_string()].into_iter().collect());

        assert_eq!(_find_the_word_sets(input).len(), 1);
    }
        
}
