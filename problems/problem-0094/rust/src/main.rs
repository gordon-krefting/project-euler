fn get_area(k: i128, factor: i128) -> Option<i128> {
    let area_squared = (3 * k + factor) * k * k * (k + factor);
    let area = (area_squared as f64).sqrt();

    if (area == (area as u128) as f64) && ((area as i128) * (area as i128) == area_squared) {
        return Some(area as i128);
    }
    None
}

fn main() {
    let mut perimeter_total: i128 = 0;
    let limit: i128 = 1_000_000_000;

    'theloop: for k in 2..limit {
        for factor in &[-1, 1] {
            let a = k * 2;
            let b = a + factor;
            let c = a + factor;

            let perimeter = a + b + c;

            if perimeter > limit {
                break 'theloop;
            }
            match get_area(k, *factor) {
                Some(area) => {
                    println!("{}, {}, {} : Per:{}, Area:{}", a, b, c, perimeter, area);
                    perimeter_total += perimeter;
                }
                None => {}
            }
        }
    }
    println!("Ta-da? {}", perimeter_total);
}
