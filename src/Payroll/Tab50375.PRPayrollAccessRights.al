table 52193429 "PR Payroll Access Rights"
{
    Caption = 'PR Payroll Access Rights';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "User ID"; Code[100])
        {
            Caption = 'User ID';
            TableRelation = "User Setup"."User ID";
        }
        field(2; Authorized; Boolean)
        {
            Caption = 'Authorized';
        }

        field(3; "Last Modified By"; Code[50])
        {
            Caption = 'Last Modified By';
            Editable = false;
        }

        field(4; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last Modified DateTime';
            Editable = false;
        }
        field(5; "Can Edit Transactions"; Boolean)
        {

        }
        field(6; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

    }
    keys
    {
        key(PK; "User ID", "Entry No")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    begin
        // if UserId <> 'BRS\DSL' then
        //     if UserId <> 'BRS\DWESA' then
        //         Error('Deletion disabled');

    end;
}
