Table 52193929 "Key Performance Areas1"
{
    LookupPageID = "Key Performance Areas LookUp";

    fields
    {
        field(1;"Employee No";Code[20])
        {
            NotBlank = true;
        }
        field(2;Period;Code[20])
        {
            NotBlank = true;
        }
        field(3;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(4;Description;Text[200])
        {
        }
        field(5;Self;Code[20])
        {
            TableRelation = "Appraisal Grades1";
        }
        field(6;Reviewer;Code[20])
        {
            TableRelation = "Appraisal Grades1";
        }
        field(7;Comments;Text[250])
        {
        }
        field(8;"KPA Entry No";Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1;"Employee No",Period,"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }


    procedure GetKPACode() GetKPACode: Code[20]
    begin
        GetKPACode:=Code;
    end;
}

