require 'spec_helper'

describe ApplicationHelper do
  include ApplicationHelper

  context '#pretty_date' do
    context 'when just now' do
      let!(:date) { timetostr nowtime }
      it { expect(pretty_date date).to eq 'just now' }
    end

    context 'when one minute ago' do
      let!(:date) { timetostr (nowtime - 60 ) }
      it { expect(pretty_date date).to eq '1 minute ago' }
    end

    context 'when five minutes ago' do
      let!(:date) { timetostr (nowtime - (60 * 5)) }
      it { expect(pretty_date date).to eq '5 minutes ago' }
    end

    context 'when one hour ago' do
      let!(:date) { timetostr (nowtime - (60 * 60)) }
      it { expect(pretty_date date).to eq '1 hour ago' }
    end

    context 'when ten hours ago' do
      let!(:date) { timetostr (nowtime - (60 * 60 * 10)) }
      it { expect(pretty_date date).to eq '10 hours ago' }
    end

    context 'when yesterday' do
      let!(:date) { timetostr (nowtime - (60 * 60 * 24)) }
      it { expect(pretty_date date).to eq 'yesterday' }
    end

    context 'when three days ago' do
      let!(:date) { timetostr (nowtime - (60 * 60 * 24 * 3)) }
      it { expect(pretty_date date).to eq '3 days ago' }
    end

    context 'when one week ago' do
      let!(:date) { timetostr (nowtime - (60 * 60 * 24 * 7)) }
      it { expect(pretty_date date).to eq '1 week ago' }
    end

    context 'when four weeks ago' do
      let!(:date) { timetostr (nowtime - (60 * 60 * 24 * 7 * 4)) }
      it { expect(pretty_date date).to eq '4 weeks ago' }
    end
  end

  def nowtime
    DateTime.now.to_i - (60 * 60 * 9)
  end

  def timetostr time
    datetime = Time.at(time).to_datetime
    datetime.strftime "%Y-%m-%d %H:%M:%S"
  end
end
