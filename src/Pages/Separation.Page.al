Page 52194088 Separation
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = Employee;
    SourceTableView = where(Status=const(Active));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Initials;Initials)
                {
                    ApplicationArea = Basic;
                }
                field(IDNumber;"ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field(ContractType;"Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfJoin;"Date Of Join")
                {
                    ApplicationArea = Basic;
                }
                field(JobTitle;"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(FullPartTime;"Full / Part Time")
                {
                    ApplicationArea = Basic;
                }
                field(ContractEndDate;"Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoticePeriod;"Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field(TerminationCategory;"Termination Category")
                {
                    ApplicationArea = Basic;
                }
                field(GroundsforTermCode;"Grounds for Term. Code")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfLeaving;"Date Of Leaving")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(SendAlertto;"Send Alert to")
                {
                    ApplicationArea = Basic;
                }
                label(Control1000000054)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19070268;
                    Style = Strong;
                    StyleExpr = true;
                }
            }
            part(Control1000000015;"Clearing Lines")
            {
                SubPageLink = "Employee No"=field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Clearance)
            {
                Caption = 'Clearance';
                action(GenerateOutstandings)
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Outstandings';

                    trigger OnAction()
                    begin
                        EMP.SetRange(EMP."No.","No.");
                        Report.Run(51511182,false,true,EMP);
                    end;
                }
                action(CertificateofService)
                {
                    ApplicationArea = Basic;
                    Caption = 'Certificate of Service';
                    RunObject = Report "Certificate Of Service";
                }
                action(ClearanceCertificate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Clearance Certificate';

                    trigger OnAction()
                    begin
                         EMP.SetRange(EMP."No.","No.");

                        Report.Run(51511171,true,false,EMP);
                    end;
                }
                action(ClearanceCertificateBlank)
                {
                    ApplicationArea = Basic;
                    Caption = 'Clearance Certificate-Blank';
                    Enabled = false;
                    Visible = false;

                    trigger OnAction()
                    begin
                         EMP.SetRange(EMP."No.","No.");

                        Report.Run(51511171,true,false,EMP);
                    end;
                }
            }
        }
    }

    var
        KPACode: Code[20];
        EMP: Record Employee;
        Text19070268: label 'Separation Details';
}

