
table 69436 "Emergency Drill Log"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Drill ID"; Code[20])
        {
        }
        field(2; "Drill Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(3; "OSH Management Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID" where("Plan Type" = field("Drill Document Type"));

            trigger OnValidate()
            begin
                HSEPlan.Reset;
                HSEPlan.SetRange(HSEPlan."Plan ID", "OSH Management Plan ID");
                if HSEPlan.FindSet then begin
                    "Directorate ID" := HSEPlan."Directorate ID";
                    "Region ID" := HSEPlan."Region ID";
                    "Department ID" := HSEPlan."Department ID";
                    //"Project ID":=HSEPlan.
                end;
            end;
        }
        field(4; "OSH Plan Calendar ID"; Integer)
        {
            TableRelation = "HSE Plan Calendar"."Line No." where("Plan ID" = field("OSH Management Plan ID"),
                                                                  "OSH Activity Type" = filter("Emergency Drill"));

            trigger OnValidate()
            begin
                HSEPlanCalendar.Reset;
                HSEPlanCalendar.SetRange(HSEPlanCalendar."Plan ID", "OSH Management Plan ID");
                HSEPlanCalendar.SetRange(HSEPlanCalendar."Line No.", "OSH Plan Calendar ID");
                if HSEPlanCalendar.FindSet then begin
                    Description := HSEPlanCalendar.Description;
                    "Overall Drill Manager ID" := HSEPlanCalendar."Overall Owner ID";
                    "Date of Drill" := Today;
                    "Drill Location Details" := HSEPlanCalendar."Venue/Location";
                    "Assembly Point Location" := HSEPlanCalendar."Venue/Location";

                end;
            end;
        }
        field(5; "Document Date"; Date)
        {
        }
        field(6; "Evacuation Event ID"; Code[20])
        {
            TableRelation = "Evacuation Event".Code;
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Date of Drill"; Date)
        {
            Editable = false;
        }
        field(9; "Drill Start Time"; Time)
        {
        }
        field(10; "Drill End Time"; Time)
        {
        }
        field(11; "Overall Drill Manager ID"; Code[20])
        {
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));
        }
        field(12; "Drill Location Details"; Text[2048])
        {
        }
        field(13; "Assembly Point Location"; Text[2048])
        {
        }
        field(14; "Prior Notice to Staff"; Boolean)
        {
        }
        field(15; "Notice to Staff Date"; Date)
        {
        }
        field(16; "Total No. of People Involved"; Integer)
        {
        }
        field(17; "Total No. of People Evacuated"; Integer)
        {
        }
        field(18; "Total No. of recorded Injuries"; Integer)
        {
        }
        field(19; "Time Evacuation Started"; Time)
        {
        }
        field(20; "Time Evacuation Ended"; Time)
        {
        }
        field(21; "Evacuation Delay Time"; Decimal)
        {
        }
        field(22; "Overall Drill Standard"; Option)
        {
            OptionMembers = " ",Unsatisfactory,Satisfactory;
        }
        field(23; "Project ID"; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(24; "Year Code"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(25; "Directorate ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(26; "Department ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Directorate ID"));
        }
        field(27; "Region ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region));
        }
        field(28; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(29; Posted; Boolean)
        {
            Editable = false;
        }
        field(30; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(31; "Created Date/Time"; DateTime)
        {
            Editable = false;
        }
        field(32; "Primary Mission"; Text[2048])
        {
        }
        field(33; Responsibility; Code[20])
        {
        }
        field(34; "Activity Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(35; "Dimension Set ID"; Integer)
        {
        }
        field(36; "Shortcut Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(37; "Shortcut Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(38; "No Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Drill ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Drill ID" = '' then begin
            HealthSafetySetup.Get;
            HealthSafetySetup.TestField("Emergency Drill Report Nos.");
            NoSeriesManagement.InitSeries(HealthSafetySetup."Emergency Drill Report Nos.", xRec."No Series", 0D, "Drill ID", "No Series");
        end;
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
    end;

    var
        HSEPlan: Record "HSE Plan";
        HSEPlanCalendar: Record "HSE Plan Calendar";
        DimMgt: Codeunit DimensionManagement;
        HealthSafetySetup: Record "Health & Safety Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        //  "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2',"Drill Document Type","Drill ID"),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            //  IF PurchLinesExist THEN
            //    UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;
}

