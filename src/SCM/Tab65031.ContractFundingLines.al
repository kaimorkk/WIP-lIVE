
table 65031 "Contract Funding Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Project Contract No."; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Year Code"; Code[50])
        {
            // TableRelation = "Funding Year Codes";

            trigger OnValidate()
            begin
                // if FundingYear.Get("Year Code") then begin
                //     Description := FundingYear.Description;
                // end;
            end;
        }
        field(4; Description; Code[100])
        {
        }
        field(5; "Budget Start Date"; Date)
        {
        }
        field(6; "Budget End Date"; Date)
        {
        }
        field(7; "Funding Customer"; Code[50])
        {
            // TableRelation = Customer where("Funding Class" = const(Grant));
        }
        field(8; "Grant ID"; Code[50])
        {
            // TableRelation = "Grant Funding Application" where("Application Status" = const(Won));
        }
        field(9; "Funding Currency"; Code[50])
        {
            TableRelation = Currency;
        }
        field(10; "Approved Funding Limit"; Decimal)
        {
        }
        // field(11; "Job No"; Code[50])
        // {
        //     CalcFormula = lookup(Job."No." where("Project Funding Contract No" = field("Project Contract No."),
        //                                           "Country Entry Code" = field("Year Code")));
        //     FieldClass = FlowField;
        // }
        // field(12; "Job Status"; Option)
        // {
        //     CalcFormula = lookup(Job.Status where("Project Funding Contract No" = field("Project Contract No."),
        //                                            "Country Entry Code" = field("Year Code")));
        //     FieldClass = FlowField;
        //     OptionCaption = 'Planning,Quote,Open,Completed';
        //     OptionMembers = Planning,Quote,Open,Completed;
        // }
    }

    keys
    {
        key(Key1; "Project Contract No.", "Line No", "Year Code", "Funding Customer", "Grant ID", "Funding Currency")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
    // FundingYear: Record "Funding Year Codes";
}

