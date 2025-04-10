

page 80400 "Select Workplan Initiatives"
{
    Caption = 'Intiatives & Performance Indicators';
    PageType = List;
    SourceTable = "PC Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Initiative Type"; Rec."Initiative Type")
                {
                    ApplicationArea = Basic;
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
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
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Achieved Target"; AchievedTarget)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
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

                    trigger OnAction()
                    begin
                        PcLines.Reset;
                        PcLines.SetRange("Initiative No.", Rec."Initiative No.");
                        WorkplanInitiatives.SetTableview(PcLines);
                        WorkplanInitiatives.LookupMode(true);
                        // if WorkplanInitiatives.RunModal = Action::LookupOK then
                    end;
                }
                action("Sub-Indicators")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Objectives/Intiatives";
                    RunPageLink = "Workplan No." = field("Workplan No."),
                                  "Initiative No." = field("Initiative No.");
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
}

#pragma implicitwith restore

