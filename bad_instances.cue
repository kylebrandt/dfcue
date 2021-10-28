import "frame"


badFramedMixedTypesInField: #Dataframe & {
    Name: "TestFrame2"
    Fields: [
        {
             Name: "MixedValueTypesShouldFail",
             Type: "Number"
             values: [1, "a"]
        }
    ]
}

missMatchedLen: #Dataframe & {
    Name: "TestFrame2"
    Fields: [
        {
            Name: "",
            values: [1,2,3]
        },
        {
             Name: "",
             values: [1, 2]
        }
    ]
}