page 69390 "Appointment Letter"
{
    Caption = 'Appointment Letter';

    PageType = Card;
    SourceTable = "Employment Offer";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Editablex;
                field("Offer ID"; Rec."Offer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offer ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Offer Expiration Date"; Rec."Offer Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offer Expiration Date field.';
                }
                field("Employment Start Date"; Rec."Employment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Start Date field.';
                }
                field("Payroll Start Period"; Rec."Payroll Start Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Start Period field.';
                }
                field("Offer Acceptance Status"; Rec."Offer Acceptance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offer Acceptance Status field.';
                }
                field("Candidate Response Date"; Rec."Candidate Response Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Response Date field.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Pay field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Contract No."; Rec."Employee Contract No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Contract No. field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Reported"; Rec."Date Reported")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Reported field.';
                }
                group("Orientation Details")
                {
                    // Editable = false;

                    field("Orientation Status"; Rec."Orientation Status")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Orientation Status field.';
                    }
                    field("Orientation Date"; Rec."Orientation Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Orientation Date field.';
                    }
                    field("Orientation End Time"; Rec."Orientation End Time")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Orientation End Time field.';
                    }
                    field("Orientation Start Time"; Rec."Orientation Start Time")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Orientation Start Time field.';
                    }
                    field("Orientation Venue"; Rec."Orientation Venue")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Orientation Venue field.';
                    }
                    field("Orientation Room No."; Rec."Orientation Room No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Orientation Room No. field.';
                    }

                }
            }
            // part(Control70; "Offer Compensation")
            // {
            //     Editable = Editablex;
            //     SubPageLink = "Offer ID" = field("Offer ID");
            //     ApplicationArea = Basic;
            // }
            group("Applicant Details")
            {
                Editable = false;
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Birth Date field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport No. field.';
                }
                field("Tax Regitration(PIN)"; Rec."Tax Regitration(PIN)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Regitration(PIN) field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
            }
            group("Vacancy Details")
            {
                Editable = false;
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                }
                field("Work Location Details"; Rec."Work Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Location Details field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task No. field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation Group field.';
                }
                field("Hierarchically Reports To"; Rec."Hierarchically Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hierarchically Reports To field.';
                }
                field("Functionally Reports To"; Rec."Functionally Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functionally Reports To field.';
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade ID field.';
                }
                field("Salary Notch"; Rec."Salary Notch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Notch field.';
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Appointment Authority field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field("Terms of Service"; Rec."Terms of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terms of Service field.';
                }


                field("Pay Frequency"; Rec."Pay Frequency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Frequency field.';
                }
                field("Work Shift"; Rec."Work Shift")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Shift field.';
                }
                field("Work Shift Description"; Rec."Work Shift Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Shift Description field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control66; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control67; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control68; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control69; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Notify Applicant")
            {
                ApplicationArea = Basic;
                Image = Email;
                ToolTip = 'Executes the Notify Applicant action.';
                trigger OnAction()
                var
                    TXT001: label 'Notify Applicant on Terms of Employment';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.SendAppointLetter(Rec);
                    end
                end;
            }
            action("OnBoard Employee")
            {
                ApplicationArea = Basic;
                Image = GetEntries;
                ToolTip = 'Executes the OnBoard Employee action.';
                trigger OnAction()
                var
                    TXT001: label 'Generate Contract for the Applicant';
                begin
                    Rec.TestField("Offer Acceptance Status", Rec."offer acceptance status"::Accepted);
                    if Confirm(TXT001) = true then begin

                        Recruitment.GenerateContractForApplicant(Rec);
                    end
                end;
            }

            // action("Invite for Orientation")
            // {
            //     ApplicationArea = Basic;
            //     Image = GetEntries;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     ToolTip = 'Sends Orientation Details';


            //     trigger OnAction()
            //     var
            //         TXT001: label 'Notify Applicant on Orientation Details';
            //     begin
            //         if Confirm(TXT001) = true then begin
            //             Recruitment.NotifyOrientationCandidates(Rec);
            //         end
            //     end;


            // }


            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Offer ID", Rec."Offer ID");
                    Report.Run(69147, true, false, Rec);
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField("Gross Pay");
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Notify Applicant_Promoted"; "Notify Applicant")
                {
                }
                actionref("OnBoard Employee_Promoted"; "OnBoard Employee")
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category9)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }
    trigger OnNewRecord(BelowX: Boolean)
    var
        myInt: Integer;
    begin
        Rec."Document Type" := Rec."Document Type"::"Appointment Letter";
    end;

    trigger OnOpenPage()
    begin
        Editablex := true;
        if Rec."Document Status" = Rec."document status"::Closed then
            Editablex := false;
    end;

    var
        Recruitment: Codeunit Recruitment;
        Editablex: Boolean;
}

#pragma implicitwith restore

