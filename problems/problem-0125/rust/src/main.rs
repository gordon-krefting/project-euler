use std::collections::HashSet;

fn reverse(n: i64) -> i64 {
    let mut rev = 0;
    let mut n_temp = n;
    while n_temp > 0 {
        rev = rev * 10 + n_temp % 10;
        n_temp = n_temp / 10;
    }
    rev
}

fn is_palindrome(n: i64) -> bool {
    n == reverse(n)
}

fn calculate_consecutive_sum_squares(limit: i64) -> i64 {
    let mut results = HashSet::new();

    let mut lower_bound = 1;
    let lower_bound_limit = (limit as f32).sqrt() as i64 + 1;
    loop {
        let mut upper_bound = lower_bound + 1;
        loop {
            let mut sum = 0;
            for i in lower_bound..upper_bound + 1 {
                sum += i * i;
            }
            if sum > limit {
                break;
            }
            if is_palindrome(sum) {
                results.insert(sum);
            }
            upper_bound += 1;
        }
        lower_bound += 1;
        if lower_bound >= lower_bound_limit {
            break;
        }
    }
    results.iter().sum()
}

fn main() {
    println!("{}", calculate_consecutive_sum_squares((10 as i64).pow(8)));
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_is_palindrome() {
        assert!(is_palindrome(232));
        assert!(is_palindrome(999999999));
    }

    #[test]
    fn test_is_palindrome_not() {
        assert!(!is_palindrome(23));
        assert!(!is_palindrome(1000000000));
    }

    #[test]
    fn test_reverse() {
        assert_eq!(12345, reverse(54321));
    }

    #[test]
    fn test_calc() {
        assert_eq!(4164, calculate_consecutive_sum_squares(1000));
    }
}
