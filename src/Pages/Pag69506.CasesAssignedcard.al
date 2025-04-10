

page 69506 "Cases Assigned card"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = "Cases Management";
    SourceTableView = where(Status = filter(Assigned));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Enquiry Number"; Rec."Enquiry Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the <Complaint Number> field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Type of cases"; Rec."Interaction Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Enquiry field.';
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Action field.';
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enquiry Description field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
            }
            group("Member Information")
            {
                Editable = false;
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field("Loan Balance"; Rec."Loan Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Loan Balance field.';
                }
                field("Share Capital"; Rec."Share Capital")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Share Capital field.';
                }
                field("Current Deposits"; Rec."Current Deposits")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Deposits field.';
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
            }
            group("Employment Info")
            {
                Caption = 'Employment Info';
                Editable = false;
                field(Control39; Rec."Employment Info")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Employment Info field.';
                    trigger OnValidate()
                    begin
                        if Rec."Employment Info" = Rec."employment info"::Employed then begin
                            EmployerCodeEditable := true;
                            DepartmentEditable := true;
                            TermsofEmploymentEditable := true;
                            ContractingEditable := false;
                            EmployedEditable := false;
                            OccupationEditable := false;
                            PositionHeldEditable := true;
                            EmploymentDateEditable := true;
                            EmployerAddressEditable := true;
                            NatureofBussEditable := false;
                            IndustryEditable := false;
                            BusinessNameEditable := false;
                            PhysicalBussLocationEditable := false;
                            YearOfCommenceEditable := false;



                        end else
                            if Rec."Employment Info" = Rec."employment info"::Contracting then begin
                                ContractingEditable := true;
                                EmployerCodeEditable := false;
                                DepartmentEditable := false;
                                TermsofEmploymentEditable := false;
                                OccupationEditable := false;
                                PositionHeldEditable := false;
                                EmploymentDateEditable := false;
                                EmployerAddressEditable := false;
                                NatureofBussEditable := false;
                                IndustryEditable := false;
                                BusinessNameEditable := false;
                                PhysicalBussLocationEditable := false;
                                YearOfCommenceEditable := false;
                            end else
                                if Rec."Employment Info" = Rec."employment info"::Others then begin
                                    OthersEditable := true;
                                    ContractingEditable := false;
                                    EmployerCodeEditable := false;
                                    DepartmentEditable := false;
                                    TermsofEmploymentEditable := false;
                                    OccupationEditable := false;
                                    PositionHeldEditable := false;
                                    EmploymentDateEditable := false;
                                    EmployerAddressEditable := false
                                end else
                                    if Rec."Employment Info" = Rec."employment info"::"Self-Employed" then begin
                                        OccupationEditable := true;
                                        EmployerCodeEditable := false;
                                        DepartmentEditable := false;
                                        TermsofEmploymentEditable := false;
                                        ContractingEditable := false;
                                        EmployedEditable := false;
                                        NatureofBussEditable := true;
                                        IndustryEditable := true;
                                        BusinessNameEditable := true;
                                        PhysicalBussLocationEditable := true;
                                        YearOfCommenceEditable := true;
                                        PositionHeldEditable := false;
                                        EmploymentDateEditable := false;
                                        EmployerAddressEditable := false

                                    end;




                        /*IF "Identification Document"="Identification Document"::"Nation ID Card" THEN BEGIN
                          PassportEditable:=FALSE;
                          IDNoEditable:=TRUE
                          END ELSE
                          IF "Identification Document"="Identification Document"::"Passport Card" THEN BEGIN
                          PassportEditable:=TRUE;
                          IDNoEditable:=FALSE
                          END ELSE
                          IF "Identification Document"="Identification Document"::"Aliens Card" THEN BEGIN
                          PassportEditable:=TRUE;
                          IDNoEditable:=TRUE;
                        END;*/

                    end;
                }
                label(Control38)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    //  ShowMandatory = true;
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    ApplicationArea = Basic;
                    Editable = EmployedEditable;
                    ToolTip = 'Specifies the value of the Employer Name field.';
                }
                field("Employer Address"; Rec."Employer Address")
                {
                    ApplicationArea = Basic;
                    Editable = EmployerAddressEditable;
                    ToolTip = 'Specifies the value of the Employer Address field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Caption = 'WorkStation / Depot';
                    Editable = DepartmentEditable;
                    ToolTip = 'Specifies the value of the WorkStation / Depot field.';
                }
                field("Terms of Employment"; Rec."Terms of Employment")
                {
                    ApplicationArea = Basic;
                    Editable = TermsofEmploymentEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Terms of Employment field.';
                }
                field("Date of Employment"; Rec."Date of Employment")
                {
                    ApplicationArea = Basic;
                    Editable = EmploymentDateEditable;
                    ToolTip = 'Specifies the value of the Date of Employment field.';
                }
                field("Position Held"; Rec."Position Held")
                {
                    ApplicationArea = Basic;
                    Editable = PositionHeldEditable;
                    ToolTip = 'Specifies the value of the Position Held field.';
                }
                field("Expected Monthly Income"; Rec."Expected Monthly Income")
                {
                    ApplicationArea = Basic;
                    Editable = MonthlyIncomeEditable;
                    ToolTip = 'Specifies the value of the Expected Monthly Income field.';
                }
                field("Nature Of Business"; Rec."Nature Of Business")
                {
                    ApplicationArea = Basic;
                    Editable = NatureofBussEditable;
                    ToolTip = 'Specifies the value of the Nature Of Business field.';
                }
                field(Industry; Rec.Industry)
                {
                    ApplicationArea = Basic;
                    Editable = IndustryEditable;
                    ToolTip = 'Specifies the value of the Industry field.';
                }
                field("Business Name"; Rec."Business Name")
                {
                    ApplicationArea = Basic;
                    Editable = BusinessNameEditable;
                    ToolTip = 'Specifies the value of the Business Name field.';
                }
                field("Physical Business Location"; Rec."Physical Business Location")
                {
                    ApplicationArea = Basic;
                    Editable = PhysicalBussLocationEditable;
                    ToolTip = 'Specifies the value of the Physical Business Location field.';
                }
                field("Year of Commence"; Rec."Year of Commence")
                {
                    ApplicationArea = Basic;
                    Editable = YearOfCommenceEditable;
                    ToolTip = 'Specifies the value of the Year of Commence field.';
                }
                field(Occupation; Rec.Occupation)
                {
                    ApplicationArea = Basic;
                    Editable = OccupationEditable;
                    ToolTip = 'Specifies the value of the Occupation field.';
                }
                field("Others Details"; Rec."Others Details")
                {
                    ApplicationArea = Basic;
                    Editable = OthersEditable;
                    ToolTip = 'Specifies the value of the Others Details field.';
                }
            }
            group("Referee Details")
            {
                Caption = 'Referee Details';
                Editable = false;
                field("Referee Member No"; Rec."Referee Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Customer No field.';
                }
                field("Referee Name"; Rec."Referee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee Name field.';
                }
                field("Referee ID No"; Rec."Referee ID No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee ID No field.';
                }
                field("Referee Mobile Phone No"; Rec."Referee Mobile Phone No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Referee Mobile Phone No field.';
                }
            }
            group("Case Information")
            {
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Captured By field.';
                }
                field("Captured On"; Rec."Captured On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Captured On field.';
                }
                field("Date of Escalation"; Rec."Date of Escalation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Escalation field.';
                }
                field("Time of Escalation"; Rec."Time of Escalation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time of Escalation field.';
                }
                field("Date Resolved"; Rec."Date Resolved")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Resolved field.';
                }
                field("Time Resolved"; Rec."Time Resolved")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time Resolved field.';
                }
                field("Resolved User"; Rec."Resolved User")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resolved By';
                    ToolTip = 'Specifies the value of the Resolved By field.';
                }
                field("Caller Reffered To"; Rec."Caller Reffered To")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Escalated to:';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Case Escalated to: field.';
                }
                field("Case Received  Date"; Rec."Case Received  Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Received  Date field.';
                }
                field(Timelines; Rec.SLA)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SLA field.';
                }
                field("Date To Settle Case"; Rec."Date To Settle Case")
                {
                    ApplicationArea = Basic;
                    Caption = 'Expected Date of Resolution';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Expected Date of Resolution field.';
                }
                field(Recomendations; Rec.Recomendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recomendations field.';
                }
                field("Support Documents"; Rec."Support Documents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Support Documents field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Resource Assigned"; Rec."Resource Assigned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource Assigned field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Loan No"; Rec."Loan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark Resolved")
            {
                ApplicationArea = Basic;
                Image = Close;
                ToolTip = 'Executes the Mark Resolved action.';
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Resolved then begin
                        Error('Case already resolved');
                    end;

                    if Confirm('Are you sure you want to mark this case as resolved?', false) = true then begin
                        Rec.Status := Rec.Status::Resolved;
                        Rec."Date Resolved" := CurrentDateTime;
                        Rec."Time Resolved" := Time;
                    end;
                end;
            }
            action("Additional Case Details")
            {
                ApplicationArea = Basic;
                Image = Form;
                //   RunObject = Page "HR Job Applications Card";
                //  RunPageLink = "Application No" = field("Enquiry Number");
                ToolTip = 'Executes the Additional Case Details action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Mark Resolved_Promoted"; "Mark Resolved")
                {
                }
                actionref("Additional Case Details_Promoted"; "Additional Case Details")
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        Rec.SetRange("Resource Assigned", UserId);
    end;

    trigger OnOpenPage()
    begin
        Rec.SetRange("Resource Assigned", UserId);
    end;

    var
        // CustCare: Record "General Equiries.";
        AssignedReas: Record "Cases Management";
        caseCare: Record "Cases Management";
        casep: Record "Cases Management";
        notifymail: Codeunit "Email Message";
        EmploymentInfoEditable: Boolean;
        EmployedEditable: Boolean;
        ContractingEditable: Boolean;
        NatureofBussEditable: Boolean;
        IndustryEditable: Boolean;
        BusinessNameEditable: Boolean;
        PhysicalBussLocationEditable: Boolean;
        YearOfCommenceEditable: Boolean;
        PositionHeldEditable: Boolean;
        EmploymentDateEditable: Boolean;
        EmployerAddressEditable: Boolean;
        EmployerCodeEditable: Boolean;
        DepartmentEditable: Boolean;
        TermsofEmploymentEditable: Boolean;
        OccupationEditable: Boolean;
        OthersEditable: Boolean;
        MonthlyIncomeEditable: Boolean;
        LoanNoVisible: Boolean;

    local procedure sms()
    var
        iEntryNo: Integer;
    begin

        //SMS MESSAGE
        /*SMSMessages.RESET;
        IF SMSMessages.FIND('+') THEN BEGIN
        iEntryNo:=SMSMessages."Entry No";
        iEntryNo:=iEntryNo+1;
        END
        ELSE BEGIN
        iEntryNo:=1;
        END;

        SMSMessages.RESET;
        SMSMessages.INIT;
        SMSMessages."Entry No":=iEntryNo;
        SMSMessages."Account No":="Member No.";
        SMSMessages."Date Entered":=TODAY;
        SMSMessages."Time Entered":=TIME;
        SMSMessages.Source:='Cases';
        SMSMessages."Entered By":=USERID;
        SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
        //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
        SMSMessages."SMS Message":='Your case/complain has been received and assigned to.'+"Resource #2"+
                                  ' kindly contact the resource for follow ups';
        Cust.RESET;
        IF Cust.GET("Member No.") THEN
        SMSMessages."Telephone No" := Cust."Phone No.";
        SMSMessages.INSERT;*/

    end;

    local procedure smsResolved()
    var
        iEntryNo: Integer;
    begin

        //SMS MESSAGE
        /*  SMSMessages.RESET;
          IF SMSMessages.FIND('+') THEN BEGIN
          iEntryNo:=SMSMessages."Entry No";
          iEntryNo:=iEntryNo+1;
          END
          ELSE BEGIN
          iEntryNo:=1;
          END;

          SMSMessages.RESET;
          SMSMessages.INIT;
          SMSMessages."Entry No":=iEntryNo;
          SMSMessages."Account No":="Member No.";
          SMSMessages."Date Entered":=TODAY;
          SMSMessages."Time Entered":=TIME;
          SMSMessages.Source:='Cases';
          SMSMessages."Entered By":=USERID;
          SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
          //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
          SMSMessages."SMS Message":='Your case/complain has been resolved by.'+"Resolved User"+
                                    ' Thank you for your being our priority customer';
          cust.RESET;
          IF cust.GET("Member No.") THEN
          SMSMessages."Telephone No" := cust."Phone No.";
          SMSMessages.INSERT;*/

    end;

    local procedure Sendtouser()
    var
        iEntryNo: Integer;
        Usersetup: Record User;
        phoneNo: Code[20];
        userAuthorizer: Text;
    begin
        /*Usersetup.RESET;
        Usersetup.SETRANGE(Usersetup."User Name","Resource Assigned");
        IF Usersetup.FIND('-')THEN BEGIN
        phoneNo:=Usersetup."Phone No";
        END;
            IF SMSMessage.FIND('+') THEN BEGIN
              iEntryNo:=SMSMessage."Entry No";
              iEntryNo:=iEntryNo+1;
              END
              ELSE BEGIN
              iEntryNo:=1;
              END;
        
              SMSMessage.RESET;
              SMSMessage.INIT;
              SMSMessage."Entry No":=iEntryNo;
              SMSMessage."Account No":=userAuthorizer;
              SMSMessage."Date Entered":=TODAY;
              SMSMessage."Time Entered":=TIME;
              SMSMessage.Source:= 'CASES';
              SMSMessage."Entered By":=USERID;
              SMSMessage."Sent To Server":=SMSMessage."Sent To Server"::No;
              SMSMessage."SMS Message":='Your have been assigned a cases of '+ "Member No."+'of '+"Case Description"+'on'+FORMAT(TODAY)+'at'+FORMAT(TIME)+'kindly give it priority' ;
              SMSMessage."Telephone No":=phoneNo;
              SMSMessage.INSERT;
        */

    end;

    local procedure SendEmailuser()
    var
        Usersetup: Record User;
        phoneNo: Code[20];
        UserEmail: Text;
    begin
        /*Usersetup.RESET;
        Usersetup.SETRANGE(Usersetup."User Name","Resource Assigned");
        IF Usersetup.FIND('-')THEN BEGIN
        UserEmail:=Usersetup."Contact Email";
        END;
        GenSetUp.GET;GenSetUp.GET;
        IF GenSetUp."Send Email Notifications" = TRUE THEN BEGIN
        notifymail.CreateMessage(USERID,GenSetUp."Sender Address",UserEmail,'Case Reported','Dear '+Usersetup."User Name"+' Your have been assigned a cases of '+' Member: '+ "Member No."+' ' +"Case Description"+' on '
        +FORMAT(TODAY)+'kindly give it priority',FALSE);
        
        
        
        notifymail.Send;
        
        
        
        END;
        */

    end;

    local procedure Emailcustomer()
    var
        CustomerEmailtext: Text;
    begin
        /*IF memb.GET("Member No.")THEN BEGIN
          CustomerEmailtext:=memb."E-Mail (Personal)";
          END ELSE
          CustomerEmailtext:=memb."E-Mail";
        GenSetUp.GET();
        IF GenSetUp."Send Email Notifications" = TRUE THEN BEGIN
         //notifymail.CreateMessage('Cases Reported',GenSetUp."Sender Address",UserEmail,'Your have been assigned a cases of '+ "Member No"+'of '+"Case Description"+'on'+FORMAT(TODAY)+'at'+FORMAT(TIME)+'kindly give it priority',FALSE);
        notifymail.CreateMessage(USERID,GenSetUp."Sender Address", CustomerEmailtext,'Case Reported','Dear '+memb.Name+' Your case/complain has been fully resolved by '+' User: '+ USERID+' ' +"Case Description"+' on '
        +FORMAT(TODAY)+'thank you  for being our customer',FALSE);
        
        
        notifymail.Send;
        
        
        
        END;
        */

    end;
}

#pragma implicitwith restore

