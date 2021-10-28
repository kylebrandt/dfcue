import "frame"

myFrame: #Dataframe & {
    Name: "TestFrame"
    Fields: [
        {
            Name: "TestNumberField"
            Labels: {"test": "test", "a": "b"}
            Type: "int64"
            values: [1,2,3,4]
        },
        {
            Name: "TestNumberFieldWithNull"
            Type: "nullableInt64"
            values: [1,2,null,4]
        },
        {
            Name: "TestSringField",
            Type: "string"
            values: ["a", "b", "c", "d"]
        },
        {
            Name: "TestNumberFieldWithNull"
            Type: "nullableString"
            values: ["a", "b", null, "d"]
        },

    ]
}