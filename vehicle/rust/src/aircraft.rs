use crate::Vehicle;

pub trait Aircraft: Vehicle {
  fn get_engine(&self) -> String {
    String::from("turbofan aircraft engines")
  }

  fn pilot(&self) {
    println!("Aircraft engine: {}", Aircraft::get_engine(self));
    println!(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
  }

  fn simulate(&self) {
    self.pilot();
  }
}
