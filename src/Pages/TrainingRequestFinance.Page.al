Page 52193532 "Training Request Finance"
{
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
                    Editable = false;
                }
                field(LocalorAbroad; "Local or Abroad")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SourceofFunding; "Source of Funding")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TrainingObjective; "Training Objective")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Objective';
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Title';
                    Editable = false;
                }
                field(PlannedStartDate; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PlannedEndDate; "Planned End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoOfDays; "No. Of Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DateofTravel; "Date of Travel")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReturnDate; "Return Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TrainingInsitution; "Training Insitution")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    NotBlank = true;
                }
                field(Venue; Venue)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    NotBlank = true;
                }
                field(PerDiem; "Per Diem")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReimbursibleImprest; "Reimbursible Interest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reimbursible Imprest';
                    Editable = false;
                }
                field(RequiresFlight; "Requires Flight")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AirTicketTransport; "Air Ticket")
                {
                    ApplicationArea = Basic;
                    Caption = 'Air Ticket/Transport';
                    Editable = false;
                }
                field(TravelDocumentsFeesVisa; "Travel Documents Fees")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Documents Fees(Visa)';
                    Editable = false;
                }
                field(TuitionFee; "Tuition Fee")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequiresLPO; "Requires LPO")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalCost; "Total Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalCostLCY; "Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CountryCode; "Country Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    NotBlank = true;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BudgetName; "Budget Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ExchangeRateCBKMeanRate; "Exchange Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exchange Rate (CBK Mean Rate)';
                    Editable = false;
                }
                field(CBKWebsiteAddress; "CBK Website Address")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
                    Editable = false;
                }
            }
            part(Control1000000004; "Training Participants")
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
                    Visible = false;

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.SendTrainingApprovalRequest(Rec) then;
                    end;
                }
                action(NotifyFinanceProcurement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Notify Finance/Procurement';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        UserSetup.Get(UserId);
                        UserSetup.TestField("E-Mail");
                        SenderAddress := UserSetup."E-Mail";
                        TParticipants.Reset;
                        TParticipants.SetRange("Training Request", "Request No.");
                        if TParticipants.Find('-') then
                            repeat
                                Employees := TParticipants."Employee Name" + ' ' + TParticipants."Employee Name" + ', \';
                            until TParticipants.Next = 0;

                        CompInfo.Get;
                        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Reimbursible Imprest Flow", "Travel Documents Fees Flow");
                        Subject := StrSubstNo('Employee Training Plan Entry %1', "Request No.");
                        Body := StrSubstNo('This is to Notify you that the Tranining Request %1 with the following particulars needs your action, COURSE TITLE: %2 TUITION FEE: %3'
                         + 'REIMBURSIBLE IMPREST: %4 TRAVEL DOCUMENTS FEES: %5, AIRTICKET/TRANSPORT: %6, PER DIEM: %7', "Request No.", "Course Title", "Tuition Fee Flow", "Reimbursible Imprest Flow", "Travel Documents Fees Flow", "Air Ticket Flow", "Per Diem Flow");

                        // MESSAGE(Body);
                        SMTP.Create(CompInfo."Finance Support Email", Subject, Body, true);
                        Email.Send(SMTP);
                        Message('Finance has been notified');


                        //"Requires Flight"="Requires Flight"::Yes
                        if ("Requires LPO" = "Requires LPO") and ("Requires Flight" = "requires flight"::Yes) then begin

                            CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Reimbursible Imprest Flow", "Travel Documents Fees Flow");

                            Body := StrSubstNo('This is to Notify you that Training Request %1 with the following particulars needs your action-preparing LPO for tuition fee and facilitating travel;', "Request No.");
                            Body2 := StrSubstNo('\COURSE TITLE: %1\INSTITUTION: %2\START DATE: %3 END DATE: %4\TUITION FEE: %5\DATE OF TRAVEL: %6 ' + 'DATE OF RETURN: %7\DESTINATION: %8\AIR TICKET: %9\TUITION FEE: %10.',
                            "Course Title", "Training Insitution", "Planned Start Date", "Planned End Date", "Tuition Fee", "Date of Travel", "Return Date", Destination, "Air Ticket Flow");

                            SMTP.Create(CompInfo."Procurement Support E-mail", Subject, Body + Body2, true);
                            Email.Send(SMTP);
                            Message('Procurement has been notified to facilitate procurement of transport and preparation of the LPO for the tuition fee');
                        end
                        else if ("Requires LPO" = "Requires LPO") and ("Requires Flight" = "requires flight"::No) then begin

                            CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Reimbursible Imprest Flow", "Travel Documents Fees Flow");

                            Body := StrSubstNo('This is to Notify you that Training Request %1 with the following particulars needs your action-preparing LPO for tuition fee;', "Request No.");
                            Body2 := StrSubstNo('\COURSE TITLE: %1\INSTITUTION: %2\START DATE: %3 END DATE: %4\TUITION FEE: %5.',
                             "Course Title", "Training Insitution", "Planned Start Date", "Planned End Date", "Tuition Fee Flow");

                            SMTP.Create(CompInfo."Procurement Support E-mail", Subject, Body + Body2, true);
                            Email.Send(SMTP);

                            Message('Procurement has been notified to facilitate preparation and sending of the LPO for the tuition fee');
                        end
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
        UserSetup: Record "User Setup";
        SenderAddress: Text[80];
        Subject: Text[100];
        Body: Text[250];
        CompInfo: Record "Company Information";
        SMTP: Codeunit "Email Message";
        Email: Codeunit Email;
        Employees: Text[500];
        TParticipants: Record "Training Participants";
        Body2: Text[250];
}

