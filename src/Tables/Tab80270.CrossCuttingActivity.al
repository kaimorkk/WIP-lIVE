Table 80270 "Cross Cutting Activity"
{
    DataClassification = CustomerContent;
    //DrillDownPageID = "Cross Cutting Activitiy";
    // LookupPageID = "Cross Cutting Activitiy";

    fields
    {
        field(1; "Entry No"; Code[10])
        {
        }
        field(2; "Cross Cutting Item"; Code[10])
        {

            trigger OnValidate()
            begin
                /*CrossCuttingSetup.RESET;
                CrossCuttingSetup.SETRANGE(Code,"Cross Cutting Item");
                IF CrossCuttingSetup.FIND('-') THEN BEGIN
                      Description:=CrossCuttingSetup.Name;
                      Division:=CrossCuttingSetup.Division;
                      Department:=CrossCuttingSetup.Department;
                   END;*/

            end;
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; Division; Text[50])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(5; Department; Text[50])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));

            trigger OnValidate()
            begin
                CrossCuttingActivity.Reset;
                CrossCuttingActivity.SetCurrentkey("Entry No", Division, Department, "Cross Cutting Item");
                CrossCuttingActivity.SetRange(Division, Division);
                CrossCuttingActivity.SetRange(Department, Department);
                CrossCuttingActivity.SetAscending("Cross Cutting Item", true);
                if not CrossCuttingActivity.FindLast then begin
                    "Cross Cutting Item" := '01';
                    "Entry No" := Department + '_' + "Cross Cutting Item";
                end else begin
                    "Cross Cutting Item" := IncStr(CrossCuttingActivity."Cross Cutting Item");
                    "Entry No" := CrossCuttingActivity.Department + '_' + "Cross Cutting Item";
                    // VALIDATE("Entry No");
                end;
            end;
        }
        field(6; "Created By"; Code[50])
        {
        }
        field(7; "Created at"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", Division, Department)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        CrossCuttingActivity: Record "Cross Cutting Activity";
    begin
        "Created at" := Today;
        "Created By" := UserId;
    end;

    var
        // CrossCuttingSetup: Record "Cross Cutting Setup";
        CrossCuttingActivity: Record "Cross Cutting Activity";
}

