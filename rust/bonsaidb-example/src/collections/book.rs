use bonsaidb::core::document::{CollectionDocument, Emit};
use bonsaidb::core::schema::view::CollectionViewSchema;
use bonsaidb::core::schema::{Collection, ReduceResult, View, ViewMapResult, ViewMappedValue};
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Collection)]
#[collection(name = "books", views = [BooksAuthorView])]
pub struct Book {
    pub title: String,
    pub author: String,
}

#[derive(Debug, Clone, View)]
#[view(collection = Book, key = String, value = u32, name = "books-by-author")]
pub struct BooksAuthorView;

impl CollectionViewSchema for BooksAuthorView {
    type View = Self;

    fn map(&self, document: CollectionDocument<Book>) -> ViewMapResult<Self::View> {
        document
            .header
            .emit_key_and_value(document.contents.author, 1)
    }

    fn reduce(
        &self,
        mappings: &[ViewMappedValue<Self>],
        _rereduce: bool,
    ) -> ReduceResult<Self::View> {
        Ok(mappings.iter().map(|m| m.value).sum())
    }
}
