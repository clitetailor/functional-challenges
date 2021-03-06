use crate::{Vehicle, Car};

pub struct Ferrari {}

impl Ferrari {
  pub fn new() -> Ferrari {
    Ferrari {}
  }
}

impl Car for Ferrari {
  fn get_engine(&self) -> String {
    String::from("F154")
  }
}

impl Vehicle for Ferrari {}
