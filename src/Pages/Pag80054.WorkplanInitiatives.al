

page 80054 "Workplan Initiatives"
{
    Caption = 'Intiatives & Performance Indicators';
    PageType = ListPart;
    SourceTable = "PC Objective";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initiative Type"; Rec."Initiative Type")
                {
                    ApplicationArea = Basic;
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity No./Broad Objective';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        PCObjective: Record "PC Objective";
                        PerfomanceContrHdr: Record "Perfomance Contract Header";
                    begin
                        if PerfomanceContrHdr.Get(Rec."Goal ID") then begin
                            PCObjective.Reset();
                            PCObjective.SetRange("Workplan No.", PerfomanceContrHdr."Annual Workplan");
                            if PCObjective.FindFirst() then begin
                                if Page.RunModal(Page::"Select Workplan Initiatives", PCObjective) = Action::LookupOK then begin
                                    Rec."Initiative No." := PCObjective."Initiative No.";
                                    Rec."Workplan No." := PCObjective."Workplan No.";
                                    Rec."Objective/Initiative" := PCObjective."Objective/Initiative";
                                    Rec."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                end;
                            end;
                        end;

                        // trigger OnLookup()
                        /*    var
                               UserSetup: Record "User Setup";
                           begin
                               UserSetup.SetFilter("User ID", '<>%1', "User ID");
                               if PAGE.RunModal(PAGE::"Approval User Setup", UserSetup) = ACTION::LookupOK then
                                   Validate("Approver ID", UserSetup."User ID");
                           end;

                           trigger OnValidate()
                           begin
                               if "Approver ID" = "User ID" then
                                   FieldError("Approver ID");
                           end; */
                    end;
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    Caption = 'Strategic Objective';
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Annual Target Qty"; Rec."Previous Annual Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agreed Targets';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Achieved Target"; AchievedTarget)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Evaluated Targets"; Rec."Evaluated Targets")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Evaluated Targets field.';
                // }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                // field(Department; Rec.Department)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Department field.';
                // }
                // field("Court Stations"; Rec."Court Stations")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Court Stations field.';
                // }
                // field(Office; Rec.Office)
                // {
                //     ApplicationArea = All;S
                //     ToolTip = 'Specifies the value of the Office field.';
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Select Activities")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    trigger OnAction()
                    begin
                        PcLines.Reset;
                        PcLines.SetRange("Initiative No.", Rec."Initiative No.");
                        WorkplanInitiatives.SetTableview(PcLines);
                        WorkplanInitiatives.LookupMode(true);
                        //  if WorkplanInitiatives.RunModal = Action::LookupOK then
                    end;
                }
                action("Sub-Indicators")
                {
                    ApplicationArea = Basic;
                    // Visible = IsPMMU;
                    RunObject = Page "Sub Objectives/Intiatives";
                    RunPageLink = "Strategy Plan ID" = field("Strategy Plan ID"),
                                  "Workplan No." = field("Workplan No."),
                                  "Initiative No." = field("Initiative No.");
                }

                action("Sub-Activities")
                {
                    ApplicationArea = Basic;
                    // Visible = isWp;
                    Image = Notes;
                    RunObject = Page "Sub Workplan Activity";
                    RunPageLink = "Workplan No." = field("Workplan No."),
                    "Activity Id" = field("Initiative No.");
                    //"Workplan No." = field(No),
                    //            "Activity Id" = field("Activity ID");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        AchievedTarget := 0;
        AchievedTarget := FnGetAchievedTargets(Rec."Workplan No.", Rec."Initiative No.");
    end;

    var
        PcLines: Record "PC Objective";
        WorkplanInitiatives: Page "Workplan Initiatives";
        AchievedTarget: Decimal;


    procedure FnGetAchievedTargets(PCNumber: Code[50]; ActivityID: Code[50]) AchievedT: Decimal
    var
        PCObjective: Record "PC Objective";
    begin
        AchievedT := 0;
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", PCNumber);
        PCObjective.SetRange("Initiative No.", ActivityID);
        if PCObjective.Find('-') then begin
            PCObjective.CalcFields("Individual Achieved Targets", "Functional Achieved Targets", "CEO Achieved Targets", "Board Achieved Targets",
                                  "Directors Achieved Targets", "Department Achieved Target");

            if PCObjective."Individual Achieved Targets" > 0 then
                AchievedT := PCObjective."Individual Achieved Targets";

            if PCObjective."Functional Achieved Targets" > 0 then
                AchievedT := PCObjective."Functional Achieved Targets";

            if PCObjective."CEO Achieved Targets" > 0 then
                AchievedT := PCObjective."CEO Achieved Targets";

            if PCObjective."Board Achieved Targets" > 0 then
                AchievedT := PCObjective."Board Achieved Targets";

            if PCObjective."Directors Achieved Targets" > 0 then
                AchievedT := PCObjective."Directors Achieved Targets";

            if PCObjective."Department Achieved Target" > 0 then
                AchievedT := PCObjective."Department Achieved Target";

        end;
        exit;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        IsPMMU := true;
        isWp := true;
        PerfomanceContrHdr.Reset();
        PerfomanceContrHdr.SetRange(No, Rec."Workplan No.");
        if PerfomanceContrHdr.FindFirst() then begin
            if PerfomanceContrHdr."Score Card Type" <> PerfomanceContrHdr."Score Card Type"::Directors then
                IsPMMU := false;
            if PerfomanceContrHdr."Score Card Type" <> PerfomanceContrHdr."Score Card Type"::Departmental then
                isWp := false;
        end;
    end;

    var
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        IsPMMU: Boolean;
        isWp: Boolean;
        IsPAS: Boolean;
}

#pragma implicitwith restore

