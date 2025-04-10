
table 69423 "HSE Plan"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
        }
        field(2; "Plan Type"; Option)
        {
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(3; "Document Date"; Date)
        {
        }
        field(4; "Risk Management Plan ID"; Code[20])
        {
            TableRelation = if ("Plan Type" = const(Corporate)) "Risk Management Plan"."Document No" where("Document Type" = const(Corporate))
            else
            if ("Plan Type" = const("Functional (Directorate)")) "Risk Management Plan"."Document No" where("Document Type" = const("Functional (Directorate)"))
            else
            if ("Plan Type" = const("Functional (Department)")) "Risk Management Plan"."Document No" where("Document Type" = const("Functional (Department)"))
            else
            if ("Plan Type" = const("Functional (Region)")) "Risk Management Plan"."Document No" where("Document Type" = const("Functional (Region)"));
        }
        field(5; Description; Text[430])
        {
        }
        field(6; "Safety Rules&Regulations Temp"; Code[20])
        {
            TableRelation = "OSH Rule Template"."Template ID" where(Blocked = const(false));
        }
        field(7; "Directorate ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(8; "Department ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
        field(9; "Region ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region));
        }
        field(10; "Primary Mission"; Text[430])
        {
        }
        field(11; "Overall Safety Manager"; Code[20])
        {
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));
        }
        field(12; "Planning Start Date"; Date)
        {
        }
        field(13; "Planning End Date"; Date)
        {
        }
        field(14; "Dimension Set ID"; Integer)
        {
        }
        field(15; Blocked; Boolean)
        {
        }
        field(16; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(17; "Created By"; Code[50])
        {
        }
        field(18; "Created Date/Time"; DateTime)
        {
        }
        field(19; "No. of OSH Management Plans"; Integer)
        {
        }
        field(20; "No. of Safe Work Permit App"; Integer)
        {
        }
        field(21; "No.of Safe Work Completion rep"; Integer)
        {
        }
        field(22; "No. of Emergency Drill Reports"; Integer)
        {
        }
        field(23; "No. of Risk Incident Logs"; Integer)
        {
        }
        field(24; "No. of OSH Trainings"; Integer)
        {
        }
        field(25; "No. of OSH Meetings"; Integer)
        {
        }
        field(26; "No. of OSH Inspection Reports"; Integer)
        {
        }
        field(27; "No. of OSH Imp Status Reports"; Integer)
        {
        }
        field(28; "No. of Risk Incidents"; Integer)
        {
        }
        field(29; "Actual Financial Impact (LCY)"; Integer)
        {
        }
        field(30; "Actual Delay/Disruption (Days)"; Integer)
        {
        }
        field(31; "Actual No. Injured Persons"; Integer)
        {
        }
        field(32; "Actual No. of Fatalities"; Integer)
        {
        }
        field(33; "Shortcut Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(34; "Shortcut Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(35; "No. Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Plan ID" = '' then begin
            HealthSafetySetup.Get;
            HealthSafetySetup.TestField("OSH Management Plan Nos.");
            NoSeriesManagement.InitSeries(HealthSafetySetup."OSH Management Plan Nos.", xRec."No. Series", 0D, "Plan ID", "No. Series");
        end;
        "Document Date" := Today;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        HSEPlanLine: Record "HSE Plan Line";
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        HealthSafetySetup: Record "Health & Safety Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagement: Record "Risk Management Plan";

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2',"Plan Type","Plan ID"),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            if PlanLinesExist then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    procedure PlanLinesExist(): Boolean
    begin
        HSEPlanLine.Reset;
        HSEPlanLine.SetRange(HSEPlanLine."Plan ID", "Plan ID");
        exit(not HSEPlanLine.IsEmpty);
    end;

    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ConfirmManagement: Codeunit "Confirm Management";
        NewDimSetID: Integer;
        ReceivedShippedItemLineDimChangeConfirmed: Boolean;
    begin
        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        //  if not ConfirmManagement.ConfirmProcess(Text051,true) then
        exit;

        HSEPlanLine.Reset;
        HSEPlanLine.SetRange(HSEPlanLine."Plan ID", "Plan ID");
        HSEPlanLine.LockTable;
        if HSEPlanLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(HSEPlanLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if HSEPlanLine."Dimension Set ID" <> NewDimSetID then begin
                    HSEPlanLine."Dimension Set ID" := NewDimSetID;

                    DimMgt.UpdateGlobalDimFromDimSetID(
                  HSEPlanLine."Dimension Set ID", HSEPlanLine."Shortcut Dimension 1 Code", HSEPlanLine."Shortcut Dimension 2 Code");
                    HSEPlanLine.Modify;
                end;
            until HSEPlanLine.Next = 0;
    end;
}

