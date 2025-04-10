Table 52193440 "SMS Types"
{

    fields
    {
        field(1;Type;Code[10])
        {
            NotBlank = true;
        }
        field(2;"SMS MESSAGE";Text[250])
        {
        }
        field(3;"Source Type";Option)
        {
            OptionCaption = ' ,BirthDay,Contributions Received,Welcome,Loan Approval,Loan Application Rejection,Web Notification,Password Reset';
            OptionMembers = " ",BirthDay,"Contributions Received",Welcome,"Loan Approval","Loan Application Rejection","Web Notification","Password Reset";
        }
        field(4;"Stage Filter";Option)
        {
            OptionCaption = ' ,Application Submitted,Confirmed  by BM,Authorized,Application sent to PenCom,Approved by PenCom,Send to Fund Admin,Payment Instruction to Custodian,Returned';
            OptionMembers = " ","Application Submitted","Confirmed  by BM",Authorized,"Application sent to PenCom","Approved by PenCom","Send to Fund Admin","Payment Instruction to Custodian",Returned;
        }
        field(5;Subject;Text[250])
        {
        }
        field(6;Activate;Boolean)
        {
        }
        field(7;Template;Blob)
        {
        }
        field(8;"Message Type";Option)
        {
            OptionCaption = 'SMS,EMAIL';
            OptionMembers = SMS,EMAIL;
        }
        field(9;"Sender Name";Text[40])
        {
        }
    }

    keys
    {
        key(Key1;Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

