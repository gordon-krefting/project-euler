// If we list all the natural numbers below 10 that are multiples of 3 or 5, we
// get 3, 5, 6 and 9. The sum of these multiples is 23.
//
// Find the sum of all the multiples of 3 or 5 below 1000.

fn fizz_buzz(limit: i64) -> i64 {
    (1..limit).filter(|i| i % 3 == 0 || i % 5 == 0).sum()
}

fn main() {
    println!("{}", fizz_buzz(1000));
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_fizz_buzz() {
        assert_eq!(fizz_buzz(10), 23);
        assert_eq!(fizz_buzz(1000), 233168);
    }
}
