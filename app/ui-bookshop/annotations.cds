using CatalogService as service from '../../srv/cat-service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Title}',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Description}',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Value : author.name,
                Label : '{i18n>Author1}',
            },
            {
                $Type : 'UI.DataField',
                Value : genre.name,
                Label : '{i18n>Genero}',
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Stock1}',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Criticality}',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Price}',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'image',
                Value : image,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Descripction}',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Author}',
            Value : author_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : author.name,
            Label : 'name',
        },
    ],
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : descr,
            Label : 'descr',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : author.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : genre.name,
        },
    ],
    UI.LineItem #tableMacro1 : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : '{i18n>Title}',
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
            Label : '{i18n>Description1}',
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : '{i18n>Price}',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : '{i18n>Stock1}',
        },
        {
            $Type : 'UI.DataField',
            Value : author.name,
            Label : '{i18n>Author1}',
            @UI.Importance : #High,
        },
    ],
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'dateOfBirth',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'dateOfDeath',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'placeOfBirth',
            },
        ],
    }
};

