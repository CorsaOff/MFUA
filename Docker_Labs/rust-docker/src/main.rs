@'
fn main() {
    println!("Hello from Rust inside Docker! 🦀");
}
'@ | Out-File -FilePath src/main.rs -Encoding utf8