use crate::{Vehicle, Car};

pub struct Ferrari {}

impl Ferrari {
  pub fn new() -> Ferrari {
    Ferrari {}
  }
}

impl Car for Ferrari {}

impl Vehicle for Ferrari {}
