
page 75419 "Procurement Plann Entry"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Procurement Plan Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ProcurementPlanID; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = ProcurementPlanNoVisible;
                }
                field(PlanningCategory; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field(EntryNo; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PlanItemType; Rec."Plan Item Type")
                {
                    ApplicationArea = Basic;
                }
                field(PlanItemNo; Rec."Plan Item No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementType; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field(SolicitationType; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementMethod; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field(ReservationCode; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reservation Code';
                }
                field(PreferenceReservationCode; Rec."Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field(FundingSourceID; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionProductGroup; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementUse; Rec."Procurement Use")
                {
                    ApplicationArea = Basic;
                }
                field(InvitationNoticeType; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field(PlanningDate; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(UnitCost; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field(LineBudgetCost; Rec."Line Budget Cost")
                {
                    ApplicationArea = Basic;
                }

                field("Budget Control Amount"; Rec."Budget Control Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Control Amount field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Q1Quantity; Rec."Q1 Quantity")
                {
                    ApplicationArea = Basic;
                }
                field(Q1Amount; Rec."Q1 Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Q2Quantity; Rec."Q2 Quantity")
                {
                    ApplicationArea = Basic;
                }
                field(Q2Amount; Rec."Q2 Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Q3Quantity; Rec."Q3 Quantity")
                {
                    ApplicationArea = Basic;
                }
                field(Q3Amount; Rec."Q3 Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Q4Quantity; Rec."Q4 Quantity")
                {
                    ApplicationArea = Basic;
                }
                field(Q4Amount; Rec."Q4 Amount")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetControlJobNo; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetControlJobTaskNo; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Account"; Rec."Budget Account")
                {
                    ApplicationArea = Basic;
                }

                field(InviteTender; Rec."Invite Tender")
                {
                    ApplicationArea = Basic;
                }
                field(OpenTender; Rec."Open Tender")
                {
                    ApplicationArea = Basic;
                }
                field(BidEvaluation; Rec."Bid Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field(TenderCommitteeAction; Rec."Tender Committee Action")
                {
                    ApplicationArea = Basic;
                }
                field(NotificationofAward; Rec."Notification of Award")
                {
                    ApplicationArea = Basic;
                }
                field(SigningofContract; Rec."Signing of Contract")
                {
                    ApplicationArea = Basic;
                }
                field(WorkCommencement; Rec."Work Commencement")
                {
                    ApplicationArea = Basic;
                }
                field(Completionofworks; Rec."Completion of works")
                {
                    ApplicationArea = Basic;
                }
                field(UnitofMeasure; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(SectionLengthKm; Rec."Section Length(Km)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(WorkPlanProjectID; Rec."Work Plan Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(WorkplanTaskNo; Rec."Workplan Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(TotalPRNCommitments; Rec."Total PRN Commitments")
                {
                    ApplicationArea = Basic;
                }
                field(TotalActualCosts; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                // field(TotalContractCommitments; Rec."Total Contract Commitments")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(TotalPOCommitments; Rec."Total PO Commitments")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(TotalPurchaseCommitments; Rec."Total Purchase Commitments")
                // {
                //     ApplicationArea = Basic;
                // }
                field(AvailableProcurementBudget; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control40; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        // Rec.CalcFields("Total Contract Commitments", "Total Actual Costs");
        //tota
        // Rec."Available Procurement Budget" := Rec."Line Budget Cost" - (Rec."Total Contract Commitments" + Rec."Total Actual Costs");
    end;

    trigger OnInit()
    begin
        //ProcurementPlanNoVisible:=TRUE;
    end;

    var
        ProcurementPlanNo: Code[20];

        ProcurementPlanNoVisible: Boolean;

        ProcurementPlanLineNoVisible: Boolean;


    procedure SetProcurementNo(No: Code[20])
    begin
        ProcurementPlanNo := No;
    end;


    procedure SetProcurementNoVisible(NewJobNoVisible: Boolean)
    begin
        ProcurementPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetProcuremntLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        ProcurementPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}

#pragma implicitwith restore

