package frame


// DataQueryResponse is named QueryDataResponse in the go sdk backend package
// In the Go SDK there is responses property but I have removed that for this model.
#DataQueryResponse: {
        [#refId]: #DataResponse
}

// DataResponse contains the results to an individual query
#DataResponse: {
        Frames: [...#Dataframe]
        Error?: string
}

#TypedDataResponse: #DataResponse & {
        DataType?: "" | "Table" | "TimeSeriesMany" | "TimeSeriesWide" | "TimeSeriesLong" | "NumberMany" | "NumberWide"
}

#refId: string

// Dataframe is a columnar table made up of fields
#Dataframe: {
    Name: string,
    Fields: [...#Field]
    _fieldLen: int

    // all fields must be the same length
    // error message may be like "missMatchedLen._fieldLen: conflicting values 2 and 3" if an instance of 
    // Dataframe. This is because _fieldLen does not collacse to the same value
    for f in Fields {
        _fieldLen: len(f.values)
    }

}

#Field: {
    Name: string
    Labels?: [string]: string
    #AllFieldTypes 
}

#FieldTypeRule: {
  Type: string
  values: [..._]
}

#StringFieldTypes: #FieldTypeString | #FieldTypeNullableString

#NumericFieldTypes: #FieldTypeInt8 | #FieldTypeNullableInt8 | #FieldTypeInt16 | #FieldTypeNullableInt16 | #FieldTypeInt32 | #FieldTypeNullableInt32 | #FieldTypeInt64 | #FieldTypeNullableInt64 | #FieldTypeUint8 | #FieldTypeNullableUint8 | #FieldTypeUint16 | #FieldTypeNullableUint16 | #FieldTypeUint32 | #FieldTypeNullableUint32 | #FieldTypeUint64 | #FieldTypeNullableUint64 | #FieldTypeFloat32 | #FieldTypeNullableFloat32 | #FieldTypeFloat64 | #FieldTypeNullableFloat64

#TimeFieldTypes: #FieldTypeTime | #FieldTypeNullableTime

#AllFieldTypes: #NumericFieldTypes | #StringFieldTypes | #TimeFieldTypes | #FieldTypeBool | #FieldTypeNullableBool 

// FieldTypes
#FieldTypeInt8: #FieldTypeRule & {
        Type: "int8"
        values: [...int8]
}

#FieldTypeNullableInt8: #FieldTypeRule & {
        Type: "nullableInt8"
        values: [...int8|null]
}

#FieldTypeInt16: #FieldTypeRule & {
        Type: "int16"
        values: [...int16]
}

#FieldTypeNullableInt16: #FieldTypeRule & {
        Type: "nullableInt16"
        values: [...int16|null]
}

#FieldTypeInt32: #FieldTypeRule & {
        Type: "int32"
        values: [...int32]
}

#FieldTypeNullableInt32: #FieldTypeRule & {
        Type: "nullableInt32"
        values: [...int32|null]
}

#FieldTypeInt64: #FieldTypeRule & {
        Type: "int64"
        values: [...int64]
}

#FieldTypeNullableInt64: #FieldTypeRule & {
        Type: "nullableInt64"
        values: [...int64|null]
}

#FieldTypeUint8: #FieldTypeRule & {
        Type: "uint8"
        values: [...uint8]
}

#FieldTypeNullableUint8: #FieldTypeRule & {
        Type: "nullableUint8"
        values: [...uint8|null]
}

#FieldTypeUint16: #FieldTypeRule & {
        Type: "uint16"
        values: [...uint16]
}

#FieldTypeNullableUint16: #FieldTypeRule & {
        Type: "nullableUint16"
        values: [...uint16|null]
}

#FieldTypeUint32: #FieldTypeRule & {
        Type: "uint32"
        values: [...uint32]
}

#FieldTypeNullableUint32: #FieldTypeRule & {
        Type: "nullableUint32"
        values: [...uint32|null]
}

#FieldTypeUint64: #FieldTypeRule & {
        Type: "uint64"
        values: [...uint64]
}

#FieldTypeNullableUint64: #FieldTypeRule & {
        Type: "nullableUint64"
        values: [...uint64|null]
}

#FieldTypeFloat32: #FieldTypeRule & {
        Type: "float32"
        values: [...float32]
}

#FieldTypeNullableFloat32: #FieldTypeRule & {
        Type: "nullableFloat32"
        values: [...float32|null]
}

#FieldTypeFloat64: #FieldTypeRule & {
        Type: "float64"
        values: [...float64]
}

#FieldTypeNullableFloat64: #FieldTypeRule & {
        Type: "nullableFloat64"
        values: [...float64|null]
}

#FieldTypeString: #FieldTypeRule & {
        Type: "string"
        values: [...string]
}

#FieldTypeNullableString: #FieldTypeRule & {
        Type: "nullableString"
        values: [...string|null]
}

#FieldTypeBool: #FieldTypeRule & {
        Type: "bool"
        values: [...bool]
}

#FieldTypeNullableBool: #FieldTypeRule & {
        Type: "nullableBool"
        values: [...bool|null]
}

#FieldTypeTime: #FieldTypeRule & {
        Type: "time"
        values: [...#time]
}

#FieldTypeNullableTime: #FieldTypeRule & {
        Type: ""
        values: [...#time|null]
}

#time: #epochMS

#epochMS: number // ?

