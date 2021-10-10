use std::process::{Command, Stdio};

fn main() {
    println!("cargo:rerun-if-changed=dhall");
    println!("cargo:rerun-if-changed=data/template.cls");
    println!("cargo:rerun-if-changed=data/me.jpg");

    Command::new("./update.sh")
        .stdin(Stdio::null())
        .stderr(Stdio::inherit())
        .stdout(Stdio::inherit())
        .spawn()
        .expect("Could not build PDF and JSON");
}
