use crate::{Aircraft, Car, Submarine, Vehicle};

pub struct Hybrid {}

impl Hybrid {
  pub fn new() -> Hybrid {
    Hybrid {}
  }
}

impl Car for Hybrid {}

impl Aircraft for Hybrid {}

impl Submarine for Hybrid {}

impl Vehicle for Hybrid {
  fn get_engine(&self) -> String {
    String::from("hybrid engine")
  }

  fn simulate(&self) {
    println!("Vehicle engine: {}", Vehicle::get_engine(self));

    Car::drive(self);
    Aircraft::pilot(self);
    Submarine::dive(self);
  }
}
