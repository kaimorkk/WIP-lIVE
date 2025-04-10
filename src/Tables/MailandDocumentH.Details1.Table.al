Table 52193699 "Mail and Document H. Details1"
{
    // //DrillDownPageID = UnknownPage51034;
    // //LookupPageID = UnknownPage51034;

    fields
    {
        field(1; "Action Code"; Code[10])
        {

            trigger OnValidate()
            begin
                if "Action Code" <> xRec."Action Code" then begin
                    SalesSetup.Get;
                    NoSeriesMgt.TestManual(SalesSetup."Action Numbers");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Action Description"; Text[100])
        {
        }
        field(3; "Assigned to"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                /*IF Employees.GET("Award Criteria Score") THEN
                "Award Criteria Sc. Description":=Employees."First Name";
                 */

            end;
        }
        field(4; "Assigned to Name"; Text[30])
        {
        }
        field(5; "Date out"; Date)
        {
        }
        field(6; "Time out"; Time)
        {
        }
        field(7; "Date completed"; Date)
        {
        }
        field(8; "Time completed"; Time)
        {
        }
        field(9; Status; Option)
        {
            OptionMembers = " ","Not Started","In Progress",Completed,"Waiting on someone else",Deferred;
        }
        field(10; Category; Option)
        {
            OptionMembers = " ",Red,Blue,Green,Orange;
        }
        field(11; "Mail Code"; Code[10])
        {
            TableRelation = "Document Management1";
        }
        field(12; "Date Due"; Date)
        {
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Action Code", "Mail Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Action Code" = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField("Action Numbers");
            NoSeriesMgt.InitSeries(SalesSetup."Action Numbers", xRec."Action Code", 0D, "Action Code", "No. Series");
        end;
    end;

    var
        Employees: Record Employee;
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

