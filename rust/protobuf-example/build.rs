fn main() {
    println!("protobuf codegen");
    protobuf_codegen::Codegen::new()
        .pure()
        .includes(&["src/protos"])
        .input("src/protos/person.proto")
        // Specify output directory relative to Cargo output directory.
        .out_dir("src/protos")
        .run_from_script();
}
