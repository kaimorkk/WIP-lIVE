Table 52193441 SMS
{

    fields
    {
        field(1;AUTOID;BigInteger)
        {
            AutoIncrement = false;
        }
        field(2;PHONENO;Code[30])
        {
        }
        field(3;Message;Text[250])
        {
        }
        field(4;VENDOR;Code[30])
        {
        }
        field(5;NETWORKNAME;Text[30])
        {
        }
        field(6;DATESENT;DateTime)
        {
        }
        field(7;DELIVERYREPORT;Code[20])
        {
        }
        field(8;DELIVERYSTATUS;Integer)
        {
        }
        field(9;DELIVERYDATE;DateTime)
        {
        }
        field(10;SENDERID;Code[50])
        {
        }
        field(11;MESSAGEID;Code[40])
        {
        }
        field(12;MSG_TYPE;Code[30])
        {
        }
        field(13;PIN;Code[20])
        {
        }
        field(14;COMMENT;Code[30])
        {
        }
        field(15;TRANSID;Code[50])
        {
        }
        field(16;EMPLOYER;Code[100])
        {
        }
        field(17;"SMS URL";Blob)
        {
            SubType = Memo;
        }
        field(18;Sent;Boolean)
        {
        }
        field(19;"Batch No";Code[20])
        {
            TableRelation = SMS;
        }
        field(20;"Source Type";Option)
        {
            OptionCaption = ' ,Inflow,Outflow,BirthDay,Form Receipt,PIN Received,Contributions Received,Welcome,Web Notification,Password Reset,RSA Contributions,VC Contributions,RedemptionTracker,NSITF,Unilever,Delta,Contributions Received2,Additional Subscription,Unitised Schemes';
            OptionMembers = " ",Inflow,Outflow,BirthDay,"Form Receipt","PIN Received","Contributions Received",Welcome,"Web Notification","Password Reset","RSA Contributions","VC Contributions",RedemptionTracker,NSITF,Unilever,Delta,"Contributions Received2","Additional Subscription","Unitised Schemes";
        }
        field(21;"Member No";Code[20])
        {
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(Key1;AUTOID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

