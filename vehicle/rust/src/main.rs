trait Vehicle {
    fn get_engine(&self) -> String {
        String::from("steam engine")
    }

    fn simulate(&self) {
        println!("Vehicle engine: {}", self.get_engine());
    }
}

trait Car: Vehicle {
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

trait Aircraft: Vehicle {
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

trait Submarine: Vehicle {
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

struct Ferrari {}

impl Ferrari {
    fn new() -> Ferrari {
        Ferrari{}
    }
}

impl Car for Ferrari {}

impl Vehicle for Ferrari {}

struct Hybrid {}

impl Hybrid {
    fn new() -> Hybrid {
        Hybrid{}
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
