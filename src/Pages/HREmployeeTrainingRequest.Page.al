Page 50022 "HR Employee Training Request"
{
    PageType = Card;
    SourceTable = "ESS Training Request1";

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
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DirectorateName; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode; "Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field(DateofTravel; "Date of Travel")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate; "Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(PerDiemDays; "Per Diem Days")
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
                field(TuitionFee; "Tuition Fee Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tuition Fee';
                    Editable = false;
                }
                field(PerDiem; "Per Diem Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Per Diem';
                    Editable = false;
                }
                field(RequiresFlight; "Requires Flight")
                {
                    ApplicationArea = Basic;
                }
                field(AirTicket; "Air Ticket Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Air Ticket';
                    Editable = false;
                }
                field(ReimbursibleImprest; "Reimbursible Imprest Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reimbursible Imprest';
                    Editable = false;
                }
                field(TravelDocumentsFees; "Travel Documents Fees Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Documents Fees';
                    Editable = false;
                }
                field(TotalCost; "Total Cost")
                {
                    ApplicationArea = Basic;
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
                field(ExchangeRateCBKMeanRate; "Exchange Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exchange Rate (CBK Mean Rate)';
                }
                field(TotalCostLCY; "Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
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
                field(Attachment; Attachment)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TrainingOfficerStatus; "TO Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Officer Status';
                    Editable = false;
                }
                field(TrainingOfficerRemarks; "TO Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Officer Remarks';
                }
            }
            part(Control1000000043; "Request Training Participants")
            {
                SubPageLink = "Training Request" = field("Request No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Visible = false;

                trigger OnAction()
                begin
                    //RESET;
                    //SETFILTER("Request No.","Request No.");
                    //REPORT.RUN(69106,TRUE,TRUE,Rec);
                    //RESET;
                end;
            }
            action(TransfertoTrainingPlan)
            {
                ApplicationArea = Basic;
                Caption = 'Transfer to Training Plan';

                trigger OnAction()
                begin

                    TrainingRec.Init;
                    HumanResSetup.Get;
                    HumanResSetup.TestField(HumanResSetup."Training Request Nos");
                    TrainingRec."Request No." := NoSeriesMngmt.GetNextNo(HumanResSetup."Training Request Nos", Today, true);
                    TrainingRec."Request Date" := Today;
                    TrainingRec."Department Code" := "Department Code";
                    TrainingRec.Status := Status;
                    TrainingRec.Designation := Designation;
                    TrainingRec.Period := Period;
                    TrainingRec."No. Of Days" := "No. Of Days";
                    TrainingRec."Training Insitution" := "Training Insitution";
                    TrainingRec.Venue := Venue;
                    TrainingRec."Training Objective" := "Training Objective";
                    TrainingRec."Tuition Fee" := "Tuition Fee";
                    TrainingRec."Per Diem" := "Per Diem";
                    TrainingRec."Air Ticket" := "Air Ticket";
                    TrainingRec."Total Cost" := "Total Cost";
                    TrainingRec."Course Title" := "Course Title";
                    TrainingRec.Description := Description;
                    TrainingRec."Planned Start Date" := "Planned Start Date";
                    TrainingRec."Planned End Date" := "Planned End Date";
                    TrainingRec."Country Code" := "Country Code";
                    TrainingRec."Exchange Rate" := "Exchange Rate";
                    TrainingRec."Total Cost (LCY)" := "Total Cost (LCY)";
                    TrainingRec.Currency := Currency;
                    TrainingRec."Source of Funding" := "Source of Funding";
                    TrainingRec."Group or Individual" := "Group or Individual";
                    TrainingRec."Local or Abroad" := "Local or Abroad";
                    TrainingRec.Directorate := Directorate;
                    TrainingRec."Department Name" := "Department Name";
                    TrainingRec."Directorate Name" := "Directorate Name";

                    //TrainingRec.RESET;
                    TrainingRec.SetRange(TrainingRec."Planned Start Date", "Planned Start Date");
                    TrainingRec.SetRange(TrainingRec."Planned End Date", "Planned End Date");
                    TrainingRec.SetRange(TrainingRec.Description, Description);
                    if not TrainingRec.Find('-') then
                        TrainingRec.Insert;


                    TrainingRec.Reset;
                    TrainingRec.SetRange(TrainingRec.Description, Description);
                    //TrainingRec."Training Objective"
                    if TrainingRec.Find('-') then begin
                        RequestParticipants.Reset;
                        RequestParticipants.SetRange(RequestParticipants."Training Request", "Request No.");
                        if RequestParticipants.Find('-') then
                            repeat
                                TrainingParticipants.Init;
                                TrainingParticipants."Training Request" := TrainingRec."Request No.";
                                TrainingParticipants."Employee No" := RequestParticipants."Employee No";
                                TrainingParticipants."Employee Name" := RequestParticipants."Employee Name";
                                TrainingParticipants.Designation := RequestParticipants.Designation;
                                TrainingParticipants.Directorate := RequestParticipants.Directorate;
                                TrainingParticipants.Department := RequestParticipants.Department;
                                TrainingParticipants.Insert;
                            until RequestParticipants.Next = 0;
                    end;

                    "TO Status" := "to status"::Approved;
                    Modify;



                    if UserSetup.Get(UserId) then
                        UserSetup.TestField("E-Mail");
                    SenderAddress := UserSetup."E-Mail";
                    SenderName := COMPANYNAME;


                    if UserSetup.Get("User ID") then begin
                        UserSetup.TestField("E-Mail");
                        Recipient := UserSetup."E-Mail";
                        // HOD:=UserSetup.HOD;
                        if Users.Get(UserSetup.HOD) then
                            HODEmail := Users."E-Mail";
                    end;



                    Subject := 'Approval of Training Request';
                    Body := 'This is to inform you that Employee Individual Training Request No. ' + "Request No." + ' has been approved for addition to the CMA Approved Training Plan. ' + "TO Remarks";

                    SMTPSetup.Create(Recipient, Subject, Body, true);
                    // SMTPSetup.AddCC(HODEmail);
                    Email.Send(SMTPSetup);
                end;
            }
            action(RejectRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Reject Request';

                trigger OnAction()
                begin
                    "TO Status" := "to status"::Rejected;
                    Modify;



                    if UserSetup.Get(UserId) then
                        UserSetup.TestField("E-Mail");
                    SenderAddress := UserSetup."E-Mail";
                    SenderName := COMPANYNAME;


                    if UserSetup.Get("User ID") then begin
                        UserSetup.TestField("E-Mail");
                        Recipient := UserSetup."E-Mail";
                        // HOD:=UserSetup.HOD;
                        if Users.Get(UserSetup.HOD) then
                            HODEmail := Users."E-Mail";
                    end;



                    Subject := 'Rejection of Training Request';
                    Body := 'This is to inform you that Employee Individual Training Request No. ' + "Request No." + ' has NOT been approved for addition to the CMA Approved Training Plan.\Training Officer Remarks: ' + "TO Remarks";

                    SMTPSetup.Create(Recipient, Subject, Body, true);
                    //SMTPSetup.AddCC(HODEmail);
                    Email.Send(SMTPSetup);
                end;
            }
            action(ApproveRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Approve Request';

                trigger OnAction()
                begin
                    "TO Status" := "to status"::Approved;
                    Modify;



                    if UserSetup.Get(UserId) then
                        UserSetup.TestField("E-Mail");
                    SenderAddress := UserSetup."E-Mail";
                    SenderName := COMPANYNAME;


                    if UserSetup.Get("User ID") then begin
                        UserSetup.TestField("E-Mail");
                        Recipient := UserSetup."E-Mail";
                        // HOD:=UserSetup.HOD;
                        if Users.Get(UserSetup.HOD) then
                            HODEmail := Users."E-Mail";
                    end;



                    Subject := 'Approval of Training Request';
                    Body := 'This is to inform you that Employee Individual Training Request No. ' + "Request No." + ' has been approved for addition to the CMA Approved Training Plan.\Training Officer Remarks: ' + "TO Remarks";

                    SMTPSetup.Create(Recipient, Subject, Body, true);
                    //SMTPSetup.AddCC(HODEmail);
                    Email.Send(SMTPSetup);
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

    trigger OnAfterGetCurrRecord()
    begin
        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Travel Documents Fees Flow", "Reimbursible Imprest Flow");
        "Tuition Fee Flow" := "Tuition Fee Flow" + "Tuition Fee";
        "Per Diem Flow" := "Per Diem Flow" + "Per Diem";
        "Air Ticket Flow" := "Air Ticket Flow" + "Air Ticket";
        //"Travel Documents Fees Flow":="Travel Documents Fees Flow"+;
        "Reimbursible Imprest Flow" := "Reimbursible Imprest Flow" + "Reimbursible Interest";

        "Total Cost" := "Tuition Fee Flow" + "Per Diem Flow" + "Air Ticket Flow" + "Travel Documents Fees Flow" + "Reimbursible Imprest Flow";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Travel Documents Fees Flow", "Reimbursible Imprest Flow");
        "Tuition Fee Flow" := "Tuition Fee Flow" + "Tuition Fee";
        "Per Diem Flow" := "Per Diem Flow" + "Per Diem";
        "Air Ticket Flow" := "Air Ticket Flow" + "Air Ticket";
        //"Travel Documents Fees Flow":="Travel Documents Fees Flow"+;
        "Reimbursible Imprest Flow" := "Reimbursible Imprest Flow" + "Reimbursible Interest";

        "Total Cost" := "Tuition Fee Flow" + "Per Diem Flow" + "Air Ticket Flow" + "Travel Documents Fees Flow" + "Reimbursible Imprest Flow";
    end;

    trigger OnOpenPage()
    begin
        //SETRANGE("User ID",USERID);
        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Travel Documents Fees Flow", "Reimbursible Imprest Flow");
        "Tuition Fee Flow" := "Tuition Fee Flow" + "Tuition Fee";
        "Per Diem Flow" := "Per Diem Flow" + "Per Diem";
        "Air Ticket Flow" := "Air Ticket Flow" + "Air Ticket";
        //"Travel Documents Fees Flow":="Travel Documents Fees Flow"+;
        "Reimbursible Imprest Flow" := "Reimbursible Imprest Flow" + "Reimbursible Interest";
        "Total Cost" := "Tuition Fee Flow" + "Per Diem Flow" + "Air Ticket Flow" + "Travel Documents Fees Flow" + "Reimbursible Imprest Flow";
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        D: Date;
        TrainingRec: Record "Training Request1";
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        Employee: Record Employee;
        UserSetup: Record "User Setup";
        SenderName: Text[50];
        SenderAddress: Text[80];
        Subject: Text[100];
        Recipient: Text[80];
        Body: Text[250];
        Users: Record "User Setup";
        HODEmail: Text[80];
        TrainingParticipants: Record "Training Participants";
        RequestParticipants: Record "Request Training Participants";
        NoSeriesMngmt: Codeunit NoSeriesManagement;
        HumanResSetup: Record "Human Resources Setup";
}

