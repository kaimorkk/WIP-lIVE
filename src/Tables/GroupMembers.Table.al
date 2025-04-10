Table 52193460 "Group Members"
{

    fields
    {
        field(1;"Record No.";Code[20])
        {
            TableRelation = Customer;
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Constituency Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(4;"Group Code";Code[20])
        {
        }
        field(5;"ID No.";Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin

                Grpmember.Reset;
                Grpmember.SetFilter("Group Code",'<>%1',"Group Code");
                Grpmember.SetRange("ID No.","ID No.");
                if Grpmember.Find('-') then begin
                 repeat
                  "Exist in Other Group":=true;
                   "Member of":="Member of"+','+Grpmember."Group Code" ;
                 until Grpmember.Next=0;
                end;
            end;
        }
        field(6;"Member Name";Text[100])
        {
        }
        field(7;Gender;Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(8;"Exist in Other Group";Boolean)
        {
            Editable = false;
        }
        field(9;"Member of";Code[100])
        {
            Editable = false;
        }
        field(10;DOB;Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                 "Age of Member":= Dates.DetermineAge(DOB,Today);
            end;
        }
        field(11;"Age of Member";Text[100])
        {
            Editable = false;
        }
        field(12;"Telephone No";Code[20])
        {
        }
        field(13;"Application No";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Record No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Dates: Codeunit "HR Dates";
        Grpmember: Record "Group Members";
}

