pub trait Vehicle {
  fn get_engine(&self) -> String {
      String::from("steam engine")
  }

  fn simulate(&self) {
      println!("Vehicle engine: {}", self.get_engine());
  }
}
