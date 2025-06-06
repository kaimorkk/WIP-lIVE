Table 52193892 "Employee Kin1"
{
    Caption = 'Employee Relative';

    fields
    {
        field(1;"Employee Code";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(2;Relationship;Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Relative1";
        }
        field(3;SurName;Text[50])
        {
            NotBlank = true;
        }
        field(4;"Other Names";Text[100])
        {
            NotBlank = true;
        }
        field(5;"ID No/Passport No";Text[50])
        {
        }
        field(6;"Date Of Birth";Date)
        {
        }
        field(7;Occupation;Text[100])
        {
        }
        field(8;Address;Text[250])
        {
        }
        field(9;"Office Tel No";Text[100])
        {
        }
        field(10;"Home Tel No";Text[50])
        {
        }
        field(11;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Employee Code",SurName,"Other Names")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        HRCommentLine: Record "Human Resource Comment Line";
    begin
        HRCommentLine.SetRange("Table Name",HRCommentLine."table name"::"Employee Relative");
        HRCommentLine.SetRange("No.","Employee Code");
        HRCommentLine.DeleteAll;
    end;
}

