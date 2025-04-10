Page 52194149 "Training Request-Approval"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Training Request1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo; "Request No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GrouporIndividual; "Group or Individual")
                {
                    ApplicationArea = Basic;
                }
                field(LocalorAbroad; "Local or Abroad")
                {
                    ApplicationArea = Basic;
                }
                field(SourceofFunding; "Source of Funding")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingObjective; "Training Objective")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Objective';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Title';
                }
                field(PlannedStartDate; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(PlannedEndDate; "Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoOfDays; "No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingInsitution; "Training Insitution")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Venue; Venue)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(PerDiem; "Per Diem")
                {
                    ApplicationArea = Basic;
                }
                field(AirTicketTransport; "Air Ticket")
                {
                    ApplicationArea = Basic;
                    Caption = 'Air Ticket/Transport';
                }
                field(TuitionFee; "Tuition Fee")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCost; "Total Cost")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCostLCY; "Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CountryCode; "Country Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field(BudgetName; "Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field(ExchangeRateCBKMeanRate; "Exchange Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exchange Rate (CBK Mean Rate)';
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CBKWebsiteAddress; "CBK Website Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Budget; Budget)
                {
                    ApplicationArea = Basic;
                }
                field(Actual; Actual)
                {
                    ApplicationArea = Basic;
                }
                field(Variance; Variance)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000006; "Training Participants")
            {
                SubPageLink = "Training Request" = field("Request No."),
                              "Period End Date" = field("Period End Date");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Training)
            {
                Caption = 'Training';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.SendTrainingApprovalRequest(Rec) then;
                    end;
                }
            }
        }
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("Request No.", "Request No.");
                    Report.Run(51511193, true, true, Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        D: Date;
}

