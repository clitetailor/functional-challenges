use vehicle::{Aircraft, Car, Ferrari, Hybrid, Submarine, Vehicle};

fn main() {
    let ferrari: &dyn Car = &Ferrari::new();

    Car::simulate(ferrari);
    let hybrid = &Hybrid::new();
    println!("\n1");
    Vehicle::simulate(hybrid);

    println!("\n2");
    Aircraft::simulate(hybrid);
    println!("\n3");
    Car::simulate(hybrid);
    println!("\n4");
    Submarine::simulate(hybrid);
}
