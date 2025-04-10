Table 52194044 "Batch Invoices"
{
    // DrillDownPageID = "Batch Invoices List";
    // LookupPageID = "Batch Invoices List";

    fields
    {
        field(1; "Batch No"; Code[20])
        {

            trigger OnValidate()
            begin
                if "Batch No" <> xRec."Batch No" then begin
                    if not SalesSetup.Get then
                        Error(Text000);
                    SalesSetup.TestField("Batch Invoice Nos");
                    NoSeriesMgt.TestManual(SalesSetup."Batch Invoice Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Batch Description"; Text[150])
        {
        }
        field(3; "Created By"; Code[20])
        {
            TableRelation = "User Setup";
        }
        field(4; "Date Created"; Date)
        {
        }
        field(5; "Time Created"; Time)
        {
        }
        field(6; Posted; Boolean)
        {
            CalcFormula = lookup("Batch Invoice Lines".Posted where("Batch No" = field("Batch No")));
            FieldClass = FlowField;
        }
        field(7; "Posted By"; Code[20])
        {
            TableRelation = "User Setup";
        }
        field(8; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(9; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; "No of Invoices"; Integer)
        {
            CalcFormula = count("Batch Invoice Lines" where("Batch No" = field("Batch No")));
            FieldClass = FlowField;
        }
        field(11; "Date Posted"; Date)
        {
        }
        field(12; "Time Posted"; Time)
        {
        }
    }

    keys
    {
        key(Key1; "Batch No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Batch No" = '' then begin
            if not SalesSetup.Get then
                Error(Text000);
            SalesSetup.TestField("Batch Invoice Nos");
            NoSeriesMgt.InitSeries(SalesSetup."Batch Invoice Nos", xRec."No. Series", 0D, "Batch No", "No. Series");
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
        Text000: label 'Sales setup doesn''''t exist';
}

