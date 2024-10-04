use std::io;

fn main() {
    println!("Hello, World! Welcomd to Rust playground.");

    let mut guess = String::new();

    io::stdin().read_line(&mut guess).
        expect("Fail to read line");

    println!("You guess: {}", guess)
}
