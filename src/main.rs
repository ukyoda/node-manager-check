use std::path::Path;
use std::fs;
extern crate serde;
extern crate serde_json;
use serde::Deserialize;

fn main() {
    let has_volta = check_has_volta_config("package.json");
    let has_nvm = check_has_nvm_config(".nvmrc");
    let has_nodenv = check_has_nvm_config(".node-version");
    if has_volta {
        println!("volta");
    } else if has_nvm {
        println!("nvm");
    } else if has_nodenv {
        println!("nodenv");
    } else {
        println!("nothing");
    }
}

fn check_has_nvm_config (filename: &str) -> bool {
    let nvmrc = Path::new(filename);
    if nvmrc.is_file() {
        true
    } else {
        false
    }
}

#[derive(Deserialize)]
struct PackageJsonSubSet {
    volta: Option<VoltaConfig>,
}

#[derive(Deserialize)]
struct VoltaConfig {}

fn check_has_volta_config (filename: &str) -> bool {
    let packagejson_path = Path::new(filename);
    if packagejson_path.is_file() {
        let json_data = fs::read_to_string(filename).unwrap();
        let package_json: PackageJsonSubSet = serde_json::from_str(&json_data).unwrap();
        if package_json.volta.is_some() {
            return true
        }
    }
    false
}