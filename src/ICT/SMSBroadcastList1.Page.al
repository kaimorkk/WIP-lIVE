Page 51971 "SMS Broadcast List1"
{
    CardPageID = "SMS Broadcast Card1";
    Editable = false;
    PageType = List;
    SourceTable = "SMS Broadcast";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                }
                field(accountName; Rec.accountName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Name field.', Comment = '%';
                }
                field(emailSent; Rec.emailSent)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the isEmailSent field.', Comment = '%';
                }
                field(failed; Rec.failed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the failed field.', Comment = '%';
                }



                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(SMSMessage; Rec."SMS Message")
                {
                    ApplicationArea = Basic;
                }
                field(pvNo; Rec.pvNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the pvNo field.', Comment = '%';
                }
                field(PaymentMessage; Rec.PaymentMessage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PaymentMessage field.', Comment = '%';
                }
                field(PhoneNumber; Rec.PhoneNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PhoneNumber field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field(isSent; Rec.isSent)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the isSent field.', Comment = '%';
                }
                field(ErrorMessage; Rec.ErrorMessage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ErrorMessage field.', Comment = '%';
                }
                field(sendSMS; Rec.sendSMS)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the sendSMS field.', Comment = '%';
                }
                field(isInvalidForSMS; Rec.isInvalidForSMS)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the isInvalidForSMS field.', Comment = '%';
                }
                field(amountPaid; Rec.amountPaid)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Paid field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
    }
}

