use std::{env, fs, io::{self, BufWriter, Write}, process};
use serde_transcode::transcode;

fn bail(msg: &str) -> ! {
    eprintln!("{msg}");
    process::exit(1)
}

fn main() {
    let mut args = env::args();
    args.next();
    let path = match args.next() {
        Some(p) => p,
        None => bail(&format!("Usage: toml2json <input.toml>")),
    };
    if args.next().is_some() {
        bail(&format!("Usage: toml2json <input.toml>"));
    }

    let input = fs::read_to_string(&path)
        .unwrap_or_else(|e| bail(&format!("Failed to read {path}: {e}")));

    let toml_de = toml::de::Deserializer::parse(&input)
        .unwrap_or_else(|e| bail(&format!("Parse failed: {e}")));

    // Buffered stdout to reduce write syscalls.
    let stdout = io::stdout();
    let handle = stdout.lock();
    let mut out = BufWriter::with_capacity(256 * 1024, handle);
    let mut json_ser = serde_json::Serializer::new(&mut out);

    transcode(toml_de, &mut json_ser)
        .unwrap_or_else(|e| bail(&format!("Transcode failed: {e}")));

    // Ensure everything is flushed to stdout before exiting.
    out.flush().unwrap_or_else(|e| bail(&format!("Flush failed: {e}")));
    std::process::exit(0)
}
