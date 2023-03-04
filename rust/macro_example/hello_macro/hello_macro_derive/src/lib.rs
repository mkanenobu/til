extern crate proc_macro;

use proc_macro::TokenStream;
use quote::quote;
use syn;

// derive(HelloMacro) したときに呼び出される実装
#[proc_macro_derive(HelloMacro)]
pub fn hello_macro_derive(input: TokenStream) -> TokenStream {
    dbg!(&input);
    // 操作可能な構文木としてのRustコードの表現を構築する
    // proc-macro は TokenStream を返す必要がある（Resultを返せない）のでエラー時にはパニックさせる必要がある
    let ast = syn::parse(input).expect("Failed to parse AST");

    // トレイトの実装内容を構築
    impl_hello_macro(&ast)
}

fn impl_hello_macro(ast: &syn::DeriveInput) -> TokenStream {
    let name = &ast.ident;
    let gen = quote! {
        impl HelloMacro for #name {
            fn hello_macro() {
                println!("Hello, Macro! My name is {}!", stringify!(#name));
            }
        }
    };
    gen.into()
}
