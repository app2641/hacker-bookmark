require 'spec_helper'

describe ApplicationHelper do
  include ApplicationHelper

  context '#pretty_date' do
    before { allow(Time).to receive(:now) { Time.new(2015, 1, 1) } }
    subject { pretty_date date }

    context 'when just now' do
      let(:date) { Time.now }
      it { is_expected.to eq 'just now' }
    end

    context 'when one minute ago' do
      let(:date) { minute_ago 1 }
      it { is_expected.to eq '1 minute ago' }
    end

    context 'when five minutes ago' do
      let(:date) { minute_ago 5 }
      it { is_expected.to eq '5 minutes ago' }
    end

    context 'when one hour ago' do
      let(:date) { hour_ago 1 }
      it { is_expected.to eq '1 hour ago' }
    end

    context 'when ten hours ago' do
      let(:date) { hour_ago 10 }
      it { is_expected.to eq '10 hours ago' }
    end

    context 'when yesterday' do
      let(:date) { day_ago 1 }
      it { is_expected.to eq 'yesterday' }
    end

    context 'when three days ago' do
      let(:date) { day_ago 3 }
      it { is_expected.to eq '3 days ago' }
    end

    context 'when one week ago' do
      let(:date) { week_ago 1 }
      it { is_expected.to eq '1 week ago' }
    end

    context 'when four weeks ago' do
      let(:date) { week_ago 4 }
      it { is_expected.to eq '4 weeks ago' }
    end
  end

  def second_ago second
    Time.now - second
  end

  def minute_ago minute
    Time.now - (60 * minute)
  end

  def hour_ago hour
    Time.now - (60 * 60 * hour)
  end

  def day_ago day
    Time.now - (60 * 60 * 24 * day)
  end

  def week_ago week
    Time.now - (60 * 60 * 24 * 7 * week)
  end
end
