// This file is generated by rust-protobuf 3.2.0. Do not edit
// .proto file is parsed by pure
// @generated

// https://github.com/rust-lang/rust-clippy/issues/702
#![allow(unknown_lints)]
#![allow(clippy::all)]

#![allow(unused_attributes)]
#![cfg_attr(rustfmt, rustfmt::skip)]

#![allow(box_pointers)]
#![allow(dead_code)]
#![allow(missing_docs)]
#![allow(non_camel_case_types)]
#![allow(non_snake_case)]
#![allow(non_upper_case_globals)]
#![allow(trivial_casts)]
#![allow(unused_results)]
#![allow(unused_mut)]

//! Generated file from `person.proto`

/// Generated files are compatible only with the same version
/// of protobuf runtime.
const _PROTOBUF_VERSION_CHECK: () = ::protobuf::VERSION_3_2_0;

#[derive(PartialEq,Clone,Default,Debug)]
// @@protoc_insertion_point(message:Person)
pub struct Person {
    // message fields
    // @@protoc_insertion_point(field:Person.name)
    pub name: ::std::string::String,
    // @@protoc_insertion_point(field:Person.age)
    pub age: i32,
    // @@protoc_insertion_point(field:Person.height)
    pub height: f32,
    // @@protoc_insertion_point(field:Person.sex)
    pub sex: ::protobuf::EnumOrUnknown<person::Sex>,
    // special fields
    // @@protoc_insertion_point(special_field:Person.special_fields)
    pub special_fields: ::protobuf::SpecialFields,
}

impl<'a> ::std::default::Default for &'a Person {
    fn default() -> &'a Person {
        <Person as ::protobuf::Message>::default_instance()
    }
}

impl Person {
    pub fn new() -> Person {
        ::std::default::Default::default()
    }

    fn generated_message_descriptor_data() -> ::protobuf::reflect::GeneratedMessageDescriptorData {
        let mut fields = ::std::vec::Vec::with_capacity(4);
        let mut oneofs = ::std::vec::Vec::with_capacity(0);
        fields.push(::protobuf::reflect::rt::v2::make_simpler_field_accessor::<_, _>(
            "name",
            |m: &Person| { &m.name },
            |m: &mut Person| { &mut m.name },
        ));
        fields.push(::protobuf::reflect::rt::v2::make_simpler_field_accessor::<_, _>(
            "age",
            |m: &Person| { &m.age },
            |m: &mut Person| { &mut m.age },
        ));
        fields.push(::protobuf::reflect::rt::v2::make_simpler_field_accessor::<_, _>(
            "height",
            |m: &Person| { &m.height },
            |m: &mut Person| { &mut m.height },
        ));
        fields.push(::protobuf::reflect::rt::v2::make_simpler_field_accessor::<_, _>(
            "sex",
            |m: &Person| { &m.sex },
            |m: &mut Person| { &mut m.sex },
        ));
        ::protobuf::reflect::GeneratedMessageDescriptorData::new_2::<Person>(
            "Person",
            fields,
            oneofs,
        )
    }
}

impl ::protobuf::Message for Person {
    const NAME: &'static str = "Person";

    fn is_initialized(&self) -> bool {
        true
    }

    fn merge_from(&mut self, is: &mut ::protobuf::CodedInputStream<'_>) -> ::protobuf::Result<()> {
        while let Some(tag) = is.read_raw_tag_or_eof()? {
            match tag {
                10 => {
                    self.name = is.read_string()?;
                },
                16 => {
                    self.age = is.read_int32()?;
                },
                29 => {
                    self.height = is.read_float()?;
                },
                32 => {
                    self.sex = is.read_enum_or_unknown()?;
                },
                tag => {
                    ::protobuf::rt::read_unknown_or_skip_group(tag, is, self.special_fields.mut_unknown_fields())?;
                },
            };
        }
        ::std::result::Result::Ok(())
    }

    // Compute sizes of nested messages
    #[allow(unused_variables)]
    fn compute_size(&self) -> u64 {
        let mut my_size = 0;
        if !self.name.is_empty() {
            my_size += ::protobuf::rt::string_size(1, &self.name);
        }
        if self.age != 0 {
            my_size += ::protobuf::rt::int32_size(2, self.age);
        }
        if self.height != 0. {
            my_size += 1 + 4;
        }
        if self.sex != ::protobuf::EnumOrUnknown::new(person::Sex::MALE) {
            my_size += ::protobuf::rt::int32_size(4, self.sex.value());
        }
        my_size += ::protobuf::rt::unknown_fields_size(self.special_fields.unknown_fields());
        self.special_fields.cached_size().set(my_size as u32);
        my_size
    }

    fn write_to_with_cached_sizes(&self, os: &mut ::protobuf::CodedOutputStream<'_>) -> ::protobuf::Result<()> {
        if !self.name.is_empty() {
            os.write_string(1, &self.name)?;
        }
        if self.age != 0 {
            os.write_int32(2, self.age)?;
        }
        if self.height != 0. {
            os.write_float(3, self.height)?;
        }
        if self.sex != ::protobuf::EnumOrUnknown::new(person::Sex::MALE) {
            os.write_enum(4, ::protobuf::EnumOrUnknown::value(&self.sex))?;
        }
        os.write_unknown_fields(self.special_fields.unknown_fields())?;
        ::std::result::Result::Ok(())
    }

    fn special_fields(&self) -> &::protobuf::SpecialFields {
        &self.special_fields
    }

    fn mut_special_fields(&mut self) -> &mut ::protobuf::SpecialFields {
        &mut self.special_fields
    }

    fn new() -> Person {
        Person::new()
    }

    fn clear(&mut self) {
        self.name.clear();
        self.age = 0;
        self.height = 0.;
        self.sex = ::protobuf::EnumOrUnknown::new(person::Sex::MALE);
        self.special_fields.clear();
    }

    fn default_instance() -> &'static Person {
        static instance: Person = Person {
            name: ::std::string::String::new(),
            age: 0,
            height: 0.,
            sex: ::protobuf::EnumOrUnknown::from_i32(0),
            special_fields: ::protobuf::SpecialFields::new(),
        };
        &instance
    }
}

impl ::protobuf::MessageFull for Person {
    fn descriptor() -> ::protobuf::reflect::MessageDescriptor {
        static descriptor: ::protobuf::rt::Lazy<::protobuf::reflect::MessageDescriptor> = ::protobuf::rt::Lazy::new();
        descriptor.get(|| file_descriptor().message_by_package_relative_name("Person").unwrap()).clone()
    }
}

impl ::std::fmt::Display for Person {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        ::protobuf::text_format::fmt(self, f)
    }
}

impl ::protobuf::reflect::ProtobufValue for Person {
    type RuntimeType = ::protobuf::reflect::rt::RuntimeTypeMessage<Self>;
}

/// Nested message and enums of message `Person`
pub mod person {
    #[derive(Clone,Copy,PartialEq,Eq,Debug,Hash)]
    // @@protoc_insertion_point(enum:Person.Sex)
    pub enum Sex {
        // @@protoc_insertion_point(enum_value:Person.Sex.MALE)
        MALE = 0,
        // @@protoc_insertion_point(enum_value:Person.Sex.FEMALE)
        FEMALE = 1,
    }

    impl ::protobuf::Enum for Sex {
        const NAME: &'static str = "Sex";

        fn value(&self) -> i32 {
            *self as i32
        }

        fn from_i32(value: i32) -> ::std::option::Option<Sex> {
            match value {
                0 => ::std::option::Option::Some(Sex::MALE),
                1 => ::std::option::Option::Some(Sex::FEMALE),
                _ => ::std::option::Option::None
            }
        }

        const VALUES: &'static [Sex] = &[
            Sex::MALE,
            Sex::FEMALE,
        ];
    }

    impl ::protobuf::EnumFull for Sex {
        fn enum_descriptor() -> ::protobuf::reflect::EnumDescriptor {
            static descriptor: ::protobuf::rt::Lazy<::protobuf::reflect::EnumDescriptor> = ::protobuf::rt::Lazy::new();
            descriptor.get(|| super::file_descriptor().enum_by_package_relative_name("Person.Sex").unwrap()).clone()
        }

        fn descriptor(&self) -> ::protobuf::reflect::EnumValueDescriptor {
            let index = *self as usize;
            Self::enum_descriptor().value_by_index(index)
        }
    }

    impl ::std::default::Default for Sex {
        fn default() -> Self {
            Sex::MALE
        }
    }

    impl Sex {
        pub(in super) fn generated_enum_descriptor_data() -> ::protobuf::reflect::GeneratedEnumDescriptorData {
            ::protobuf::reflect::GeneratedEnumDescriptorData::new::<Sex>("Person.Sex")
        }
    }
}

static file_descriptor_proto_data: &'static [u8] = b"\
    \n\x0cperson.proto\"\x82\x01\n\x06Person\x12\x12\n\x04name\x18\x01\x20\
    \x01(\tR\x04name\x12\x10\n\x03age\x18\x02\x20\x01(\x05R\x03age\x12\x16\n\
    \x06height\x18\x03\x20\x01(\x02R\x06height\x12\x1d\n\x03sex\x18\x04\x20\
    \x01(\x0e2\x0b.Person.SexR\x03sex\"\x1b\n\x03Sex\x12\x08\n\x04MALE\x10\0\
    \x12\n\n\x06FEMALE\x10\x01b\x06proto3\
";

/// `FileDescriptorProto` object which was a source for this generated file
fn file_descriptor_proto() -> &'static ::protobuf::descriptor::FileDescriptorProto {
    static file_descriptor_proto_lazy: ::protobuf::rt::Lazy<::protobuf::descriptor::FileDescriptorProto> = ::protobuf::rt::Lazy::new();
    file_descriptor_proto_lazy.get(|| {
        ::protobuf::Message::parse_from_bytes(file_descriptor_proto_data).unwrap()
    })
}

/// `FileDescriptor` object which allows dynamic access to files
pub fn file_descriptor() -> &'static ::protobuf::reflect::FileDescriptor {
    static generated_file_descriptor_lazy: ::protobuf::rt::Lazy<::protobuf::reflect::GeneratedFileDescriptor> = ::protobuf::rt::Lazy::new();
    static file_descriptor: ::protobuf::rt::Lazy<::protobuf::reflect::FileDescriptor> = ::protobuf::rt::Lazy::new();
    file_descriptor.get(|| {
        let generated_file_descriptor = generated_file_descriptor_lazy.get(|| {
            let mut deps = ::std::vec::Vec::with_capacity(0);
            let mut messages = ::std::vec::Vec::with_capacity(1);
            messages.push(Person::generated_message_descriptor_data());
            let mut enums = ::std::vec::Vec::with_capacity(1);
            enums.push(person::Sex::generated_enum_descriptor_data());
            ::protobuf::reflect::GeneratedFileDescriptor::new_generated(
                file_descriptor_proto(),
                deps,
                messages,
                enums,
            )
        });
        ::protobuf::reflect::FileDescriptor::new_generated_2(generated_file_descriptor)
    })
}
