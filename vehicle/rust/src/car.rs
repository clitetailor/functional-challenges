use crate::Vehicle;

pub trait Car: Vehicle {
  fn get_engine(&self) -> String {
    String::from("four-stroke engine")
  }

  fn drive(&self) {
    println!("Car engine: {}", Car::get_engine(self));
    println!("#############################");
  }

  fn simulate(&self) {
    self.drive();
  }
}
