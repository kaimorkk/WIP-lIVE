table 96003 "Licence Reg. Education Info"
{
    Caption = 'Licence Reg. Education Summary';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Education Level"; Option)
        {
            OptionMembers = ,University,College,Other;
            OptionCaption = ',University,College,Other';
        }
        field(4; Qualification; Option)
        {
            OptionMembers = ,PHD,Masters,Degree,Diploma,Certificate,Other;
            OptionCaption = ',PHD,Masters,Degree,Diploma,Certificate,Other';
        }
        field(5; Course; Text[100])
        {
            Caption = 'Course';
        }
        field(6; Institution; Text[100])
        {
            Caption = 'Institution';
        }
        field(7; "Other Qualification"; Text[100])
        {
            Caption = 'Other Qualification';
        }
        field(8; "Other Education Level"; Text[100])
        {
            Caption = 'Other Education Level';
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        EducationInfo.Reset();
        if EducationInfo.FindLast() then
            Rec."Line No." := EducationInfo."Line No." + 1
        else
            Rec."Line No." := 1
    end;

    var
        EducationInfo: Record "Licence Reg. Education Info";
}
