Table 52193714 "Office and Keys allocations1"
{
    // //DrillDownPageID = UnknownPage51029;
    // //LookupPageID = UnknownPage51029;

    fields
    {
        field(1; "Office Allocation Code"; Code[20])
        {
        }
        field(2; Remarks; Text[30])
        {
        }
        field(6; Status; Option)
        {
            OptionMembers = " ",Occupied,Vacant;
        }
        field(7; "Employee ID"; Code[30])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Get("Employee ID");
                "Employee Name" := Emp."First Name" + ' ' + Emp."Last Name";
            end;
        }
        field(8; "Keys Allocation?"; Boolean)
        {
        }
        field(9; "Office Code"; Code[20])
        {
            TableRelation = "Office Spaces1";
        }
        field(10; "No. Series"; Code[10])
        {
        }
        field(11; Date; Date)
        {
        }
        field(12; "Employee Name"; Text[70])
        {
        }
        field(13; "Start Date"; Date)
        {
        }
        field(14; "End Date"; Date)
        {
        }
        field(15; Unit; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Office Allocation Code", "Office Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Office Allocation Code" = '' then begin
            SalesSetup.Get;
            //SalesSetup.TESTFIELD("Office Allocations");
            //NoSeriesMgt.InitSeries(SalesSetup."Office Allocations",xRec."Office Allocation Code",0D,"Office Allocation Code",
            // "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
        Status := Status::Occupied;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
}

