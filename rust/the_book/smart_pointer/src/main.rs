mod r#box;
mod deref_trait;
mod drop_trait;
mod reference_counting;

fn main() {
    r#box::heap_box();
    r#box::cons_list();

    deref_trait::deref_trait();
    drop_trait::drop_trait();

    reference_counting::reference_counting();
}
