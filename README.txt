Yritys saada Ansible-hallinta Mildred-hankkeeseen mahdollisesti
tulevalle CEPH-klusterille.

Versiohistoria:

14-12-2016 v0.1:

   Vagrantilla tehdyssä virtuaaliklusterissa admin-kone ja kolme
   OSD/MON-noodia sekä client-noodi, joka luo ja mounttaa RBD-levyn
   klusterista.  Ansible-koodi on ruma kuin piru, tehty vain nopeana
   pokkina, ja mitää kirjoittaa uudestaan refaktoroiden ja järjellä.
   Myös Vagrantissa esim. IP-osoitteita typerästi kovakoodattuina.
