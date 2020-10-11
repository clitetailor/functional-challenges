use crate::Vehicle;

pub trait Submarine: Vehicle {
  fn get_engine(&self) -> String {
    String::from("gasoline engine")
  }

  fn dive(&self) {
    println!("Submarine engine: {}", Submarine::get_engine(self));
    println!("&&&&&&&&&&&&&&&&&&&&&&&&&&");
  }

  fn simulate(&self) {
    self.dive();
  }
}
