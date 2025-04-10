Table 52193645 "My Members"
{
    Caption = 'My Members';
    // DrillDownPageID = "Member List";
    // LookupPageID = "Member List";

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; "Member No."; Code[20])
        {
            Caption = 'Member No.';
            NotBlank = true;
            TableRelation = Customer where("Customer Type" = filter(Member));
        }
    }

    keys
    {
        key(Key1; "User ID", "Member No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text001: label 'Added %1 new %2';


    procedure AddEntities(FilterStr: Text[250])
    var
        Cust: Record Customer;
        "Count": Integer;
    begin
        Count := 0;

        Cust.SetFilter("No.", FilterStr);
        if Cust.FindSet then
            repeat
                "User ID" := UserId;
                "Member No." := Cust."No.";
                if Insert then
                    Count += 1;
            until Cust.Next = 0;

        Message(Text001, Count, Cust.TableCaption);
    end;
}

