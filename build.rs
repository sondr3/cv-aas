use std::{
    env,
    process::{Command, Stdio},
};

fn main() {
    println!("cargo:rerun-if-changed=dhall");
    println!("cargo:rerun-if-changed=data/template.cls");
    println!("cargo:rerun-if-changed=data/me.jpg");

    if Ok("release".to_string()) == env::var("PROFILE") {
        Command::new("./scripts/dhall.sh")
            .stdin(Stdio::null())
            .stderr(Stdio::inherit())
            .stdout(Stdio::inherit())
            .spawn()
            .expect("Could not build PDF and JSON");
    } else {
        Command::new("./scripts/update.sh")
            .stdin(Stdio::null())
            .stderr(Stdio::inherit())
            .stdout(Stdio::inherit())
            .spawn()
            .expect("Could not build PDF and JSON");
    }
}
