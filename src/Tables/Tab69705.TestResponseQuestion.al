
table 69705 "Test Response Question"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Response ID"; Code[30])
        {
        }
        field(2; "Test ID"; Code[50])
        {
            TableRelation = "Ability Test";
        }
        field(3; "Question ID"; Code[50])
        {
            TableRelation = "Ability Test Question" where("Test ID" = field("Test ID"));

            trigger OnValidate()
            begin
                AbilityTestQuestion.Reset;
                AbilityTestQuestion.SetRange("Question ID", "Question ID");
                if AbilityTestQuestion.FindFirst then begin
                    Question := AbilityTestQuestion.Question;
                end
            end;
        }
        field(4; Question; Text[2000])
        {
        }
        field(5; "Selected Answer"; Code[30])
        {
        }
        field(6; "Pass/Fail"; Option)
        {
            OptionCaption = ' ,PASS,FAIL';
            OptionMembers = " ",PASS,FAIL;
        }
    }

    keys
    {
        key(Key1; "Response ID", "Test ID", "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AbilityTestQuestion: Record "Ability Test Question";
}

